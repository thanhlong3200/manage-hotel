package com.chondo.service;

import java.util.List;

import com.chondo.dto.HotelDTO;
import com.chondo.entity.HotelEntity;

public interface IHotelService {
	HotelDTO findOneByLocation(String location);

	List<HotelDTO> findAll();
}
