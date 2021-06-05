package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.FurnitureDTO;
import com.chondo.dto.ImageDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.FurnitureEntity;
import com.chondo.entity.ImageEntity;
import com.chondo.repository.ImageRepository;
import com.chondo.service.IImageService;

@Service
public class ImageService implements IImageService{
	@Autowired
	private ImageRepository imageRepository;

	@Override
	public void setImages(List<RoomTypeDTO> list) {
		for (RoomTypeDTO roomTypeDTO : list) {
			List<ImageEntity> entities = imageRepository.findByRoomTypeId(roomTypeDTO.getId());
			ModelMapper modelMapper = new ModelMapper();
			List<ImageDTO> listImg = modelMapper.map(entities, new TypeToken<List<ImageDTO>>(){}.getType());
			roomTypeDTO.setImages(listImg);
		}
	}
	
}
