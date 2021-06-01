package com.chondo.converter;

import org.springframework.stereotype.Component;

import com.chondo.dto.HotelDTO;
import com.chondo.entity.HotelEntity;

@Component
public class HotelConverter {
	public HotelDTO toDTO(HotelEntity entity) {
		HotelDTO dto = new HotelDTO();
		dto.setId(entity.getId());
		dto.setLocation(entity.getLocation());
		return dto;
	}
}
