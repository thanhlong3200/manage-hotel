package com.chondo.service;

import java.util.List;

import com.chondo.dto.BookingStatusDTO;

public interface IBookingStatusService {
	
	List<BookingStatusDTO> findByActive(int i);
	
}
