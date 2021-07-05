package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.BookingStatusDTO;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.BookingStatusEntity;
import com.chondo.repository.BookingStatusRepository;
import com.chondo.service.IBookingStatusService;

@Service
public class BookingStatusService implements IBookingStatusService{

	@Autowired
	private BookingStatusRepository statusRepository;
	@Override
	public List<BookingStatusDTO> findByActive(int i) {
		List<BookingStatusEntity> entities = statusRepository.findByActive(i);
		ModelMapper modelMapper = new ModelMapper();
		List<BookingStatusDTO> dtos = modelMapper.map(entities, new TypeToken<List<BookingStatusDTO>>(){}.getType());
		return dtos;
	}

}
