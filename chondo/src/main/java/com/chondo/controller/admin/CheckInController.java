package com.chondo.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;

@RestController(value = "checkInAPI")
public class CheckInController {
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@GetMapping(value = "/quan-tri/check-in")
	public ModelAndView checkInPage(@RequestParam(value = "code", required = false) String code) {
		ModelAndView mav = new ModelAndView("admin/booking/checkIn");
		if (code != null) {
			BookingDTO booking = bookingService.findOneByCode(code);
				
			if (booking != null) {
				
				List<BookedRoomDTO> bookedRooms = bookedRoomService.findByBookingId(booking.getId());
				
				mav.addObject("booking", booking);
				mav.addObject("bookedRooms", bookedRooms);
				
				
			}else {
				mav.addObject("error", "Không tìm thấy mã booking này !");
			}
			mav.addObject("code", code);
		}


		
		return mav;
	}
	
	@PostMapping(value = "/api/check-in")
	@Transactional
	public BookingDTO checkIn(@RequestBody BookingDTO booking){
		
		List<BookedRoomDTO> list = bookedRoomService.setCustomers(booking.getBookedRooms());		
		
		booking =  bookingService.findOneByBookedRoomsId(list.get(0).getId());
		
		bookingService.changeStatus(booking, "checkin");
		
		return booking;
	}
}
