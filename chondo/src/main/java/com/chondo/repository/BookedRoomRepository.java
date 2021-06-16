package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.BookedRoomEntity;

public interface BookedRoomRepository extends JpaRepository<BookedRoomEntity, Long>{

	List<BookedRoomEntity> findByBookingId(Long id);
	
}
