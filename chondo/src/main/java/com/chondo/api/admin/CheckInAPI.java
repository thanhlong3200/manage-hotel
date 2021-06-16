package com.chondo.api.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;

@RestController(value = "checkInAPI")
public class CheckInAPI {
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	
	
	@PostMapping(value = "/api/check-in")
	@Transactional
	public BookingDTO saveCustomerCheckIn(@RequestBody BookingDTO booking){
		
		List<BookedRoomDTO> list = bookedRoomService.setCustomers(booking.getBookedRooms());		
		
		booking =  bookingService.findOneByBookedRoomsId(list.get(0).getId());
		
		bookingService.changeStatus(booking, "checkin");
		
		return booking;
	}
}
