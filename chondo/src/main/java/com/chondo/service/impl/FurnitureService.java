package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.FurnitureDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.FurnitureEntity;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.repository.FurnitureRepository;
import com.chondo.service.IFurnitureService;

@Service
public class FurnitureService implements IFurnitureService{
	
	@Autowired
	private FurnitureRepository furnitureRepository;
	
	@Override
	public void setFurnitures(List<RoomTypeDTO> dtos) {
		for (RoomTypeDTO roomTypeDTO : dtos) {
			List<FurnitureEntity> entities = furnitureRepository.findByRoomTypesId(roomTypeDTO.getId());
			ModelMapper modelMapper = new ModelMapper();
			List<FurnitureDTO> list = modelMapper.map(entities, new TypeToken<List<FurnitureDTO>>(){}.getType());
			roomTypeDTO.setFurnitures(list);
		}
	}
}
