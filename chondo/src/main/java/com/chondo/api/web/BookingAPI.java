package com.chondo.api.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookedServiceService;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;
import com.chondo.service.IPaymentService;
import com.chondo.service.IRoomService;
import com.chondo.service.impl.RoomService;

@RestController(value = "bookingAPI")
public class BookingAPI {
	
	@Autowired
	private ICustomerService customerService;
	
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@Autowired
	private IBookedServiceService bookedServiceService;
	
	@Autowired 
	private IRoomService roomService;
	
	@Autowired
	private IPaymentService paymentService;
	
	@PostMapping(value = "/api/booking")
	@Transactional
	public BookingDTO save(@RequestBody BookingDTO booking){
		CustomerDTO customer;
		if ((customer = customerService.findOneByEmail(booking.getCustomer().getEmail())) == null) {
			customer = customerService.save(booking.getCustomer());
		}
		
		booking.setCustomer(customer);
		
		booking = bookingService.save(booking);
		
		List<BookedRoomDTO> bookedRooms = bookedRoomService.setBookedRooms(booking);
		
		bookedServiceService.setBookedServices(bookedRooms);
		
		paymentService.createPayment(booking);
		
		return booking;
	}
}
