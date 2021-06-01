package com.chondo.service;

import java.util.Date;
import java.util.List;

import com.chondo.dto.RoomTypeDTO;

public interface IRoomTypeService {
	List<RoomTypeDTO> findAvailable(Long hotelId, Integer roomCount,
			 Integer capacity,  Date dateFrom, Date dateTo);
}
