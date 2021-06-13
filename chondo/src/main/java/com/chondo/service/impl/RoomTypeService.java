package com.chondo.service.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.collection.spi.PersistentCollection;
import org.modelmapper.Condition;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.modelmapper.spi.MappingContext;
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
			 Integer capacity,  Date dateFrom, Date dateTo, Pageable pageable) {
		List<RoomTypeEntity> entities = roomTypeRepository.findAvailable(hotelId, roomCount, capacity, dateFrom, dateTo,pageable);
		ModelMapper modelMapper = new ModelMapper();
		List<RoomTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		return dtos;
	}


	@Override
	public RoomTypeDTO findOneById(Long roomTypeId) {
		RoomTypeEntity entity = roomTypeRepository.findOne(roomTypeId); 
		ModelMapper modelMapper = new ModelMapper();
		RoomTypeDTO dto = modelMapper.map(entity, RoomTypeDTO.class);
		return dto;
	}


	@Override
	public List<RoomTypeDTO> findByStatus(Integer status, Pageable pageable) {
		List<RoomTypeEntity> entities = roomTypeRepository.findByStatus(status,pageable);
		ModelMapper modelMapper = new ModelMapper();
		List<RoomTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		return dtos;
	}


	@Override
	public Integer countByStatus(Integer status) {
		return roomTypeRepository.countByStatus(status);
	}

	@Override
	public RoomTypeDTO save(RoomTypeDTO dto) {
		RoomTypeEntity roomTypeEntity = new RoomTypeEntity();
		ModelMapper modelMapper = new ModelMapper();
	
		if (dto.getId() != null) {
			roomTypeEntity.setId(dto.getId());
		}
		roomTypeEntity = modelMapper.map(dto, RoomTypeEntity.class);
		
		return modelMapper.map(roomTypeRepository.save(roomTypeEntity), RoomTypeDTO.class);
	}

	

	
}
