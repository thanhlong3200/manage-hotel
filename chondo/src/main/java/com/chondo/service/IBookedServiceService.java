package com.chondo.service;

import java.util.Date;
import java.util.List;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.BookingDTO;

public interface IBookedServiceService {
	BookedServiceDTO save(BookedServiceDTO dto);
//	List<BookedServiceDTO> setBookedServices(List<BookedRoomDTO> bookedRooms);
	void replaceService(BookingDTO booking);
	List<BookedServiceDTO> findByRangeDate(Date dateFrom, Date dateTo, String code);
	List<BookedServiceDTO> getAllService(String code);
}
