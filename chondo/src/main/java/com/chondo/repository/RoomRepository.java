package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.RoomEntity;

public interface RoomRepository extends JpaRepository<RoomEntity, Long>{
	List<RoomEntity> findByHotelId(Long hotelId);
	
}
