package com.chondo.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.repository.RoomsRepository;
import com.chondo.service.RoomsService;

@Service
public class RoomsServiceImpl implements RoomsService {

	@Autowired
	private RoomsRepository roomsRepository;

	@Override
	public List<RoomTypeDTO> findAll() {
		ModelMapper mapper = new ModelMapper();

		List<RoomTypeEntity> entities = roomsRepository.findAll();
		List<RoomTypeDTO> dtos = entities.stream().map(item -> mapper.map(item, RoomTypeDTO.class))
				.collect(Collectors.toList());
		return dtos;
	}

	@Override
	public List<RoomTypeDTO> findByKey(String keyword) {
		ModelMapper mapper = new ModelMapper();

		List<RoomTypeEntity> entities = roomsRepository.findByNameLike("%" + keyword + "%");
		List<RoomTypeDTO> dtos = entities.stream().map(item -> mapper.map(item, RoomTypeDTO.class))
				.collect(Collectors.toList());
		return dtos;
	}

}
