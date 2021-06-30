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
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;

@Controller(value = "checkOutController")
public class CheckOutController {

	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@RequestMapping(value = "/quan-tri/check-out", method = RequestMethod.GET)
	public ModelAndView checkInPage(@RequestParam(value = "code", required = false) String code) {
		ModelAndView mav = new ModelAndView("admin/booking/checkIn");
		if (code != null) {
			BookingDTO booking = bookingService.findOneByCode(code);
				
			if (booking != null) {
				
				List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(booking.getId());
				
				mav.addObject("booking", booking);
				mav.addObject("bookedRooms", bookedRooms);
				
				mav.addObject("code", code);
			}else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
			
		}


		
		return mav;
	}
}
