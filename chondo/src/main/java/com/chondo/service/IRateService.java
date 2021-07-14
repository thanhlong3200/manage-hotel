package com.chondo.service;

import java.util.List;

import com.chondo.dto.RateDTO;
import com.chondo.dto.RoomTypeDTO;

public interface IRateService {
	void setRates(List<RoomTypeDTO> dtos);

	void setRates(RoomTypeDTO roomtype);

	List<RateDTO> findAll();

	RateDTO save(RateDTO dto);
}
