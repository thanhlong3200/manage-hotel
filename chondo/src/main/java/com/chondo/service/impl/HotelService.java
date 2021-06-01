package com.chondo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.converter.HotelConverter;
import com.chondo.dto.HotelDTO;
import com.chondo.repository.HotelRepository;
import com.chondo.service.IHotelService;

@Service
public class HotelService implements IHotelService{
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private HotelConverter hotelConverter;
	
	@Override
	public HotelDTO findOneByLocation(String location) {
		return hotelConverter.toDTO(hotelRepository.findOneByLocationAndStatus(location,1));
	}
	
}
