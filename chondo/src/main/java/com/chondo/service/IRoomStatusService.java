package com.chondo.service;

import java.util.List;

import com.chondo.dto.RoomStatusDTO;

public interface IRoomStatusService {

	List<RoomStatusDTO> findByActive(Integer i);
	
}
