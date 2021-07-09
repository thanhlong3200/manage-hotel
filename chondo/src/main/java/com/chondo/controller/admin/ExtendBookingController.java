package com.chondo.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.BookingDTO;
import com.chondo.service.IBookingService;

@RestController(value = "extendBookingAPI")
public class ExtendBookingController {
	
	@Autowired
	private IBookingService bookingService;
	
	@PostMapping(value = "/api/extend-booking")
	@Transactional
	public BookingDTO extend(@RequestBody BookingDTO dto){	
		
		BookingDTO bookingDTO = bookingService.extend(dto);
		
		return bookingDTO;
	}
	
}
