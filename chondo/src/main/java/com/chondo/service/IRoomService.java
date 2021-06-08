package com.chondo.service;

import java.util.List;

import com.chondo.dto.RoomDTO;

public interface IRoomService {
	List<RoomDTO> findByRoomTypeIdAndStatusCode(Long id, String code);
}
