package com.chondo.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.HotelEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.repository.HotelRepository;
import com.chondo.service.ISearchService;

@Service
public class SearchService implements ISearchService{
	
	@Autowired
	private HotelRepository hotelRepository;
	


	@Override
	public List<RoomEntity> searchRoom(Date dateFrom, Date dateTo, Integer adult, Integer children, Integer roomCount,
			String location) {
		HotelEntity hotel = hotelRepository.findOneByLocationAndStatus(location, 1);
		
		return null;
	}
	
}
