package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.PaymentTypeDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;
import com.chondo.service.IPaymentService;
import com.chondo.service.IPaymentTypeService;
import com.chondo.service.IRoomService;
import com.chondo.service.IRoomStatusService;
import com.chondo.service.IServiceService;
import com.chondo.service.IUpgradeService;

@RestController(value = "paymentAPI")
public class CheckOutController {
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IPaymentService paymentService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@Autowired
	private IRoomStatusService roomStatusService;

	@Autowired
	private IUpgradeService upgradeService;
	
	@Autowired
	private IPaymentTypeService paymentTypeService;
	
	@Autowired
	private IPaymentService paymnetService;


	@RequestMapping(value = "/quan-tri/thanh-toan", method = RequestMethod.GET)
	public ModelAndView checkOutPage(@RequestParam("code") String code) {
		ModelAndView mav = new ModelAndView("admin/booking/paymentDetails");
			
		BookingDTO booking = bookingService.findOneByCode(code);
		
		bookingService.setPrice(booking);
		
		UpgradeDTO upgradeDTO = upgradeService.findOneByBookingId(booking.getId());
		if (upgradeDTO!=null) {
			mav.addObject("upgrade", upgradeDTO);
		}
		if (booking.getStatus().getCode().equalsIgnoreCase("checkout")) {
			PaymentDTO payment = paymnetService.findOneByBookingId(booking.getId());
			mav.addObject("payment", payment);
		}else {
			List<PaymentTypeDTO> types = paymentTypeService.findByActive(1);
			
			mav.addObject("types", types);
		}
		
		mav.addObject("booking", booking);
		
			
		

		return mav;
	}
	
	@GetMapping(value = "/quan-tri/check-out")
	public ModelAndView checkOutPagea(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView();
	
		if (id==null) {
			List<RoomDTO> listRooms = roomService.findAll();

			List<RoomStatusDTO> listStatus = roomStatusService.findByActive(1);

			mav.addObject("listStatus", listStatus);
			mav.addObject("listRooms", listRooms);	
			mav.setViewName("admin/booking/checkOut");
		}else {
			BookedRoomDTO bookedRoomDTO = bookedRoomService.findOneByRoomId(id);
			BookingDTO bookingDTO = bookingService.findOneByBookedRoomsId(bookedRoomDTO.getId());
			return new ModelAndView("redirect:/quan-tri/booking?id="+bookingDTO.getId());
			
		}
		
		return mav;
	}
	@PostMapping(value = "/api/check-out")
	@Transactional
	public PaymentDTO createPayment(@RequestBody PaymentDTO dto){
		
		BookingDTO bookingDTO = bookingService.findOneByCode(dto.getBooking().getCode());
		
		bookingService.changeStatus(bookingDTO, "checkout");
		
		for (BookedRoomDTO bookedRoomDTO : bookingDTO.getBookedRooms()) {
			roomService.changeStatus(bookedRoomDTO.getRoom(), "dirty");
			for (CustomerDTO customer : bookedRoomDTO.getCustomers()) {
				customerService.changeStatus(customer);
			}
		}
		
		paymentService.createPayment(bookingDTO,dto.getPaymentType().getCode());
		
		dto.setBooking(bookingDTO);
		
		return dto;
	}
}
