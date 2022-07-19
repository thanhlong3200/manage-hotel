package com.chondo.controller.web;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.util.HashAlgorithm;
import com.chondo.util.SendMailUtil;

@RestController(value = "bookingAPI")
public class BookingController {

	@Autowired
	private ICustomerService customerService;

	@Autowired
	private IBookingService bookingService;

	@Autowired
	private IBookedRoomService bookedRoomService;


	@GetMapping(value = "/quan-tri/booking")
	public ModelAndView bookingPage(@RequestParam(value = "page", required = false) Integer page,
									@RequestParam(value = "limit", required = false) Integer limit,
									@RequestParam(value = "bookingCode", required = false) String bookingCode,
									@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();

		if (id != null) {
			BookingDTO bookingDTO = bookingService.findOne(id);


			List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(bookingDTO.getId());



			mav.addObject("booking", bookingDTO);
			mav.addObject("bookedRooms", bookedRooms);

			mav.setViewName("web/detailBooking");

		} else {
			Pageable pageable = new PageRequest(page - 1, limit);

			BookingDTO dto = new BookingDTO();
			List<BookingDTO> list = bookingService.findAll(pageable);
			dto.setListResult(list);

			dto.setLimit(limit);
			dto.setPage(page);

			dto.setTotalPage((int) Math.round((double) bookingService.count() / dto.getLimit()));


			if (bookingCode != null) {
				BookingDTO search = bookingService.findOneByCode(bookingCode);

				list.clear();

				if (search != null) {
					list.add(search);
				}

				dto.setListResult(list);

				dto.setPage(1);
				dto.setTotalPage(1);
				dto.setTotalItem(1);

				mav.addObject("bookingCode", bookingCode);
			}

			mav.addObject("model", dto);
			mav.setViewName("admin/booking/list-booking");
		}

		return mav;
	}

	@GetMapping(value = "/quan-tri/huy-booking")
	public ModelAndView cancelPage(@RequestParam(value = "code", required = false) String code) {
		ModelAndView mav = new ModelAndView("admin/booking/cancelBooking");

		if (code != null) {

			BookingDTO booking = bookingService.findOneByCode(code);
			if (booking != null) {

				List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(booking.getId());

				mav.addObject("booking", booking);
				mav.addObject("bookedRooms", bookedRooms);


			} else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
		}
		mav.addObject("code", code);
		return mav;
	}



	@GetMapping(value = "/quan-tri/xac-nhan-booking")
	public ModelAndView verifyBooking(@RequestParam(value = "code") String code,
									  @RequestParam(value = "manipulation", required = false) String manipulation) {
		ModelAndView mav = new ModelAndView("admin/booking/verify-booking");
		BookingDTO booking = bookingService.findOneByCode(code);
		if (manipulation!=null) {
			bookingService.createLog(code,"verify");
			mav.setViewName("redirect:/quan-tri/xac-nhan-booking?code="+code);
		}
		mav.addObject("booking", booking);
		return mav;
	}


	@PostMapping(value = "/api/booking")
	@Transactional
	public BookingDTO save(@RequestBody BookingDTO booking) throws UnsupportedEncodingException, MessagingException{
		CustomerDTO customer;
		if ((customer = customerService.findOneByEmail(booking.getCustomer().getEmail())) == null) {
			customer = customerService.save(booking.getCustomer());
		}

		booking.setCustomer(customer);

		booking = bookingService.save(booking);

		String bookingInfo = booking.toStringBooking();
		System.out.println(bookingInfo);

		String hash = HashAlgorithm.doHashHex(booking.getInfo());

		String content = "Vui lòng ký vào đoạn dữ liệu này để xác nhận bạn là người đặt phòng\n";

		content += "=========== String SHA-256 BEGIN =============\n";
		content +=  hash + "\n";
		content += "====================END=======================\n\n";

		content += "Ký đơn hàng tại đây: ";
		content += "http://localhost:8080/chondo/kydonhang?code=" + booking.getCode();

//		//add HASH
//		bookingInfo += "\n\nBOOKING HASH SHA-256:\n------------BIGIN-----------\n\n"
//		+ hash
//		+"\n\n----------END-----------\n";
//
//		System.out.println(HashAlgorithm.doHashHex(booking.toStringBooking()));

		bookingInfo += "\n\nKý đơn hàng Tại đây: http://localhost:8080/chondo/kydonhang?code=" + booking.getCode();


		try {
			bookedRoomService.setBookedRooms(booking);
		} catch(Exception e) {
			e.printStackTrace();
		}

//		bookedServiceService.setBookedServices(bookedRooms);

//		paymentService.createPayment(booking,"Ti�?n đặt phòng");

		SendMailUtil.sendMail(customer.getEmail(), booking, content);
		return booking;
	}

	@PutMapping(value = "/api/booking")
	@Transactional
	public BookingDTO cancel(@RequestBody BookingDTO booking){

		return bookingService.save(booking);
	}
}
