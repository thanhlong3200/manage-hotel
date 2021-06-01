package com.chondo.service;

import com.chondo.dto.HotelDTO;
import com.chondo.entity.HotelEntity;

public interface IHotelService {
	HotelDTO findOneByLocation(String location);
}
