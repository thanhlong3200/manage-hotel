package com.chondo.service;

import java.util.List;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;

public interface IBookedRoomService {
	BookedRoomDTO save(BookedRoomDTO bookedRoom);
	List<BookedRoomDTO> setBookedRooms(BookingDTO booking);
	List<BookedRoomDTO> findByBookingId(Long id);
	List<BookedRoomDTO> setCustomers(List<BookedRoomDTO> bookedRooms);
	List<BookedRoomDTO> changeRoom(BookingDTO booking);
	List<BookedRoomDTO> findByBookingCode(String code);
	BookedRoomDTO findOneByRoomId(Long id);
}
