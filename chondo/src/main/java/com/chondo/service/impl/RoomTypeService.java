package com.chondo.service.impl;

import java.util.ArrayList;
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

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.repository.FurnitureRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IRoomTypeService;
@Service
public class RoomTypeService implements IRoomTypeService{
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private RoomRepository roomRepository;

	
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


	@Override
	public List<RoomTypeDTO> findAll() {
		List<RoomTypeEntity> entities = roomTypeRepository.findAll();
		ModelMapper modelMapper = new ModelMapper();
		List<RoomTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		return dtos;
	}


	@Override
	public List<RoomTypeDTO> findAvailableUpgrade(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
	
		List<RoomTypeEntity> allRoomTypeEntity = roomTypeRepository.findAll(); 
		List<RoomTypeDTO> allRoomTypeDTO = modelMapper.map(allRoomTypeEntity, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		
		List<RoomTypeDTO> availableRoomType = new ArrayList<RoomTypeDTO>();
		
		for (RoomTypeDTO roomTypeDTO : allRoomTypeDTO) {
			if (roomTypeDTO.getId() != booking.getRoomType().getId() 
					&& roomTypeDTO.getOriginalPrice() > booking.getRoomType().getOriginalPrice()) {
				List<RoomEntity> rooms =  roomRepository.findAvailable(booking.getHotel().getId(), roomTypeDTO.getId(),
						booking.getDateFrom(), booking.getDateTo());
				List<RoomDTO> dtos = modelMapper.map(rooms, new TypeToken<List<RoomDTO>>(){}.getType());
				if (dtos.size() >= booking.getRoomCount()) {
					availableRoomType.add(roomTypeDTO);
				}
			}
			
		}
		
		
		return availableRoomType;
	}


	@Override
	public List<RoomTypeDTO> findBestSeller() {
		List<RoomTypeEntity> entities = roomTypeRepository.findBestSeller();
		ModelMapper modelMapper = new ModelMapper();
		List<RoomTypeDTO> dtos = modelMapper.map(entities, new TypeToken<List<RoomTypeDTO>>(){}.getType());
		return dtos;
	}

	

	
}
