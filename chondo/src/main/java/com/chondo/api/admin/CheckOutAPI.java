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
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;
import com.chondo.service.IPaymentService;
import com.chondo.service.IRoomService;

@RestController(value = "paymentAPI")
public class CheckOutAPI {
	@Autowired
	private IBookingService bookingService;
	
	@Autowired
	private IPaymentService paymentService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private ICustomerService customerService;
	
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
