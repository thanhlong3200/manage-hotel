package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.FurnitureEntity;

public interface FurnitureRepository extends JpaRepository<FurnitureEntity, Long>{
	List<FurnitureEntity> findByRoomTypesId(Long roomTypeId);
}
