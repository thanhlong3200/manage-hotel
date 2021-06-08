package com.chondo.service;

import java.util.List;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;

public interface IBookedServiceService {
	BookedServiceDTO save(BookedServiceDTO dto);
	List<BookedServiceDTO> setBookedServices(List<BookedRoomDTO> bookedRooms);
}
