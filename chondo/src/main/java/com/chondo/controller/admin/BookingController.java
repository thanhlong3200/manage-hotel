package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.IPaymentService;
import com.chondo.service.impl.BookingService;

@Controller(value = "bookingControllerAdmin")
public class BookingController {

	@Autowired
	private IBookingService bookingService;

	@Autowired
	private IPaymentService paymentService;

	@Autowired
	private IBookedRoomService bookedRoomService;

	@RequestMapping(value = "/quan-tri/booking", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "limit", required = false) Integer limit,
			@RequestParam(value = "bookingCode", required = false) String bookingCode,
			@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();

		if (id != null) {
			BookingDTO bookingDTO = bookingService.findOne(id);

			List<PaymentDTO> payments = paymentService.findByBookingId(bookingDTO.getId());

			List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(bookingDTO.getId());

			mav.addObject("booking", bookingDTO);
			mav.addObject("payments", payments);
			mav.addObject("bookedRooms", bookedRooms);
			mav.setViewName("admin/booking/bookingDetails");
		} else {
			Pageable pageable = new PageRequest(page - 1, limit);

			BookingDTO dto = new BookingDTO();
			List<BookingDTO> list = bookingService.findAll(pageable);
			dto.setListResult(list);

			dto.setLimit(limit);
			dto.setPage(page);

			dto.setTotalPage((int) Math.round((double) bookingService.count() / dto.getLimit()));
			dto.setTotalItem(dto.getListResult().size());

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

	@RequestMapping(value = "/quan-tri/huy-booking", method = RequestMethod.GET)
	public ModelAndView cancelBookingRoom(@RequestParam(value = "code", required = false) String code) {
		ModelAndView mav = new ModelAndView("admin/booking/cancelBooking");

		if (code != null) {

			BookingDTO booking = bookingService.findOneByCode(code);
			if (booking != null) {
				List<PaymentDTO> payments = paymentService.findByBookingId(booking.getId());

				List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(booking.getId());

				mav.addObject("booking", booking);
				mav.addObject("payments", payments);
				mav.addObject("bookedRooms", bookedRooms);
				

			} else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
		}
		mav.addObject("code", code);
		return mav;
	}

}
