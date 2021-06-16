package com.chondo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.chondo.dto.RoomDTO;

public interface IRoomService {
	List<RoomDTO> findByRoomTypeIdAndStatusCode(Long id, String code);

	List<RoomDTO> findAvailable(Long hotelId, Long roomTypeId, Date dateFrom, Date dateTo);

	List<RoomDTO> findByRoomTypeId(Long roomTypeId);
}
