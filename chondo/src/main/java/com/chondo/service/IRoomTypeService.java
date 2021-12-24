package com.chondo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomTypeDTO;

public interface IRoomTypeService {
	List<RoomTypeDTO> findAvailable(Long hotelId, Integer roomCount,
			 Integer capacity,  Date dateFrom, Date dateTo, Pageable pageable);

	RoomTypeDTO findOneById(Long roomTypeId);

	List<RoomTypeDTO> findByStatus(Integer status, Pageable pageable);

	Integer countByStatus(Integer status);

	RoomTypeDTO save(RoomTypeDTO dto);

	List<RoomTypeDTO> findAll();

	List<RoomTypeDTO> findAvailableUpgrade(BookingDTO booking);

	List<RoomTypeDTO> findBestSeller();
}
