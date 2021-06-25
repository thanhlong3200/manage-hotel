package com.chondo.service.impl;

import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.repository.RoomRepository;
import com.chondo.service.IRoomService;

@Service
public class RoomService implements IRoomService{
	@Autowired
	private RoomRepository roomRepository;
	
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
		return rooms;	}
	
}
