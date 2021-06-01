package com.chondo.service.impl;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.chondo.converter.RoomTypeConverter;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IRoomTypeService;
import org.modelmapper.ModelMapper;
@Service
public class RoomTypeService implements IRoomTypeService{
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private RoomTypeConverter converter;
	
	@Override
	public List<RoomTypeDTO> findAvailable(Long hotelId, Integer roomCount,
			 Integer capacity,  Date dateFrom, Date dateTo) {;
		List<RoomTypeEntity> entities = roomTypeRepository.findAvailable(hotelId, roomCount, capacity, dateFrom, dateTo);
		ModelMapper modelMapper = new ModelMapper();
		List<RoomTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		return dtos;
	}
	
}
