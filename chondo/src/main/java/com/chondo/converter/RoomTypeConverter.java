package com.chondo.converter;

import org.springframework.stereotype.Component;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.RoomTypeEntity;

@Component
public class RoomTypeConverter {
	public RoomTypeDTO toDTO(RoomTypeEntity entity) {
		RoomTypeDTO dto = new RoomTypeDTO();
		dto.setId(entity.getId());
		return dto;
	}
}
