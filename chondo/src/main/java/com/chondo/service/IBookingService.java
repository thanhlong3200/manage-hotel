package com.chondo.service;

import com.chondo.dto.BookingDTO;

public interface IBookingService {
	BookingDTO save(BookingDTO booking);

	BookingDTO findOne(Long id);

	BookingDTO findOneByCode(String bookingCode);

	BookingDTO findOneByBookedRoomsId(Long id);

	BookingDTO changeStatus(BookingDTO booking, String code);
}
