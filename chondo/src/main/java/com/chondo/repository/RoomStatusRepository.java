package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.RoomStatusEntity;

public interface RoomStatusRepository extends JpaRepository<RoomStatusEntity, Long>{
	RoomStatusEntity findOneByCode(String code);
}
