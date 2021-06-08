package com.chondo.service.impl;

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
	
}
