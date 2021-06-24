package com.chondo.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.chondo.dto.BookingDTO;

public interface IBookingService {
	BookingDTO save(BookingDTO booking);

	BookingDTO findOne(Long id);

	BookingDTO findOneByCode(String bookingCode);

	BookingDTO findOneByBookedRoomsId(Long id);

	BookingDTO changeStatus(BookingDTO booking, String code);

	List<BookingDTO> findAll(Pageable pageable);

	Integer count();
}
