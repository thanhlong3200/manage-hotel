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
import com.chondo.dto.ServiceDTO;
import com.chondo.service.IBookedRoomService;
import com.chondo.service.IBookingService;
import com.chondo.service.ICustomerService;
import com.chondo.service.IServiceService;

@RestController(value = "serviceAPI")
public class ServiceAPI {
	@Autowired
	private IServiceService service;
	
	@Autowired
	private IBookedRoomService bookedRoomService;
	
	@PostMapping(value = "/api/service")
	@Transactional
	public ServiceDTO saveCustomerCheckIn(@RequestBody ServiceDTO dto){
		
		BookedRoomDTO bookedRoomDTO = bookedRoomService.findOneByRoomNumber(dto.getId());
		
		service.createBookedService(bookedRoomDTO,dto.getCode());
		
		return dto;
	}
}
