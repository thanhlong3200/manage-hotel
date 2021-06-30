package com.chondo.service;

import java.util.List;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.ServiceDTO;

public interface IServiceService {
	void setServices(List<RoomTypeDTO> list);

	List<ServiceDTO> findAll();

	ServiceDTO findOneByCode(String code);

	void createBookedService(BookedRoomDTO bookedRoomDTO, String serviceCode);
}
