package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.dto.RoomStatusDTO;
import com.chondo.entity.RoomStatusEntity;

public interface RoomStatusRepository extends JpaRepository<RoomStatusEntity, Long>{
	RoomStatusEntity findOneByCode(String code);

	List<RoomStatusEntity> findByActive(Integer active);
}
