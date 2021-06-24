package com.chondo.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.BookingDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;

@RestController(value = "changeRoomAPI")
public class ChangeRoomAPI {
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;

	
	@PostMapping(value = "/api/change-room")
	@Transactional
	public BookingDTO changeRoom(@RequestBody BookingDTO booking){	
		
		
		bookedRoomService.changeRoom(booking);
		
		return bookingService.findOneByCode(booking.getCode());
	}
}
