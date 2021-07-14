package com.chondo.service.impl;

import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.RoomStatusEntity;
import com.chondo.repository.HotelRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IRoomService;

@Service
public class RoomService implements IRoomService{
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private RoomStatusRepository roomStatusRepository;
	
	@Override
	public List<RoomDTO> findByRoomTypeIdAndStatusCode(Long id, String code) {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findByRoomTypeIdAndStatusCode(1L, "available");
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		return rooms;
	}

	@Override
	public List<RoomDTO> findAvailable(Long hotelId, Long roomTypeId, Date dateFrom, Date dateTo) {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findAvailable(hotelId, roomTypeId, dateFrom, dateTo);
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		return rooms;
	}

	@Override
	public List<RoomDTO> findByRoomTypeId(Long roomTypeId) {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findByRoomTypeId(roomTypeId);
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		return rooms;
	}

	@Override
	public List<RoomDTO> findAll() {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findAll();
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		return rooms;
	}

	@Override
	public List<RoomDTO> findByRoomTypeCode(String roomTypeCode) {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findByRoomTypeCode(roomTypeCode);
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		return rooms;	
	}

	@Override
	public List<RoomDTO> findByBookedRoom(Date date) {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findByBookedRoom(date);
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		return rooms;
	}

	@Override
	public RoomDTO changeStatus(RoomDTO room, String statusCode) {
		ModelMapper modelMapper = new ModelMapper();
		RoomEntity entity = roomRepository.findOne(room.getId());
		RoomStatusEntity status = roomStatusRepository.findOneByCode(statusCode);
		entity.setStatus(status);
		roomRepository.save(entity);
		return	modelMapper.map(entity,RoomDTO.class);	
	}

	@Override
	public RoomDTO findOneByNumber(Integer number) {
		ModelMapper modelMapper = new ModelMapper();
		RoomEntity entity = roomRepository.findOneByNumber(number);
		roomRepository.save(entity);
		return	modelMapper.map(entity,RoomDTO.class);	
	}

	@Override
	public RoomDTO save(RoomDTO dto) {
		RoomEntity roomEntity = new RoomEntity();
		ModelMapper modelMapper = new ModelMapper();
	
		if (dto.getId() != null) {
			roomEntity = roomRepository.findOne(dto.getId());
			
		}
		roomEntity.setNumber(dto.getNumber());
		roomEntity.setFloor(dto.getFloor());
		roomEntity.setHotel(hotelRepository.findOne(dto.getHotelId()));
		roomEntity.setRoomType(roomTypeRepository.findOne(dto.getRoomTypeId()));
		roomEntity.setStatus(roomStatusRepository.findOne(dto.getStatusId()));
		
		roomRepository.save(roomEntity);
		return dto;
	}
	
}
