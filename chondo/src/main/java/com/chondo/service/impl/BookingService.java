package com.chondo.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.BookingStatusDTO;
import com.chondo.dto.HotelDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.CustomerEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.BookingStatusRepository;
import com.chondo.repository.CustomerRepository;
import com.chondo.repository.HotelRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IBookingService;

@Service
public class BookingService implements IBookingService{
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BookingStatusRepository bookingStatusRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	
	@Override
	@Transactional
	public BookingDTO save(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
		
		BookingEntity bookingEntity = modelMapper.map(booking,BookingEntity.class);
		
		CustomerEntity customerEntity = customerRepository.findOne(booking.getCustomer().getId());
		bookingEntity.setCustomer(customerEntity);
		
		bookingEntity.setCode(getCode() + bookingRepository.count());
		bookingEntity.setStatus(bookingStatusRepository.findOneByCode("booked"));
		bookingEntity.setRoomType(roomTypeRepository.findOne(booking.getRoomType().getId()));
		bookingEntity.setHotel(hotelRepository.findOneByLocationAndStatus(booking.getHotel().getLocation(), 1));
	
		bookingEntity = bookingRepository.save(bookingEntity);
		return modelMapper.map(bookingEntity, BookingDTO.class);
	}
	

	
	private String getCode() {
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyy");  
	    Date date = new Date();  
	    return formatter.format(date);  
	}
}
