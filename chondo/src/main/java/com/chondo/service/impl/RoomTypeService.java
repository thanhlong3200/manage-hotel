package com.chondo.service.impl;

import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.repository.FurnitureRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IRoomTypeService;
@Service
public class RoomTypeService implements IRoomTypeService{
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;

	
	@Override
	public List<RoomTypeDTO> findAvailable(Long hotelId, Integer roomCount,
			 Integer capacity,  Date dateFrom, Date dateTo, Pageable pageable) {;
		List<RoomTypeEntity> entities = roomTypeRepository.findAvailable(hotelId, roomCount, capacity, dateFrom, dateTo,pageable);
		ModelMapper modelMapper = new ModelMapper();
		List<RoomTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		return dtos;
	}

	

	
}
