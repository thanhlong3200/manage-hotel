package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.RoomEntity;

public interface RoomRepository extends JpaRepository<RoomEntity, Long>{
	List<RoomEntity> findByRoomTypeIdAndStatusCode(Long roomTypeId, String code);
	RoomEntity findOneByRoomTypeIdAndStatusCode(Long roomTypeId, String code);
}
