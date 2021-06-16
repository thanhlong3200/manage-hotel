package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.IPaymentService;

@Controller(value = "checkInController")
public class CheckInController {

	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@RequestMapping(value = "/quan-tri/check-in", method = RequestMethod.GET)
	public ModelAndView checkInPage(@RequestParam(value = "bookingCode", required = false) String bookingCode) {
		ModelAndView mav = new ModelAndView("admin/booking/checkIn");
		if (bookingCode != null) {
			BookingDTO bookingDTO = bookingService.findOneByCode(bookingCode);
			
			List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(bookingDTO.getId());
			
			
			
			mav.addObject("booking", bookingDTO);
			mav.addObject("bookedRooms", bookedRooms);
		}
		
		return mav;
	}
}
