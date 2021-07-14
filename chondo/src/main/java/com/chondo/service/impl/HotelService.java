package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.converter.HotelConverter;
import com.chondo.dto.HotelDTO;
import com.chondo.dto.PaymentTypeDTO;
import com.chondo.entity.HotelEntity;
import com.chondo.entity.PaymentTypeEntity;
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

	@Override
	public List<HotelDTO> findAll() {
		List<HotelEntity> entities = hotelRepository.findAll();
		ModelMapper modelMapper = new ModelMapper();
		List<HotelDTO> dtos = modelMapper.map(entities, new TypeToken<List<HotelDTO>>(){}.getType());
		return dtos;
	}
	
}
