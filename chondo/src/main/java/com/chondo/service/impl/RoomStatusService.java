package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.RoomStatusEntity;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.service.IRoomStatusService;

@Service
public class RoomStatusService implements IRoomStatusService{
	
	@Autowired
	private RoomStatusRepository roomStatusRepository;

	@Override
	public List<RoomStatusDTO> findByActive(Integer i) {
		ModelMapper modelMapper = new ModelMapper();
		List<RoomStatusEntity> roomStatus = roomStatusRepository.findByActive(i);
		List<RoomStatusDTO> rooms = modelMapper.map(roomStatus, new TypeToken<List<RoomStatusDTO>>(){}.getType());
		return rooms;
	}

}
