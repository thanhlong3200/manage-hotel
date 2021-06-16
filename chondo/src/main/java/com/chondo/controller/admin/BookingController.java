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
	public ModelAndView homePage(@RequestParam(value = "id", required = false) Long id) {
		ModelAndView mav = new ModelAndView("admin/booking/bookingDetails");
		
		if (id != null) {
			BookingDTO bookingDTO = bookingService.findOne(id);
			
			List<PaymentDTO> payments = paymentService.findByBookingId(bookingDTO.getId());
			
			List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(bookingDTO.getId());
			
			
			
			mav.addObject("booking", bookingDTO);
			mav.addObject("payments", payments);
			mav.addObject("bookedRooms", bookedRooms);
		}
		
		return mav;
	}
}
