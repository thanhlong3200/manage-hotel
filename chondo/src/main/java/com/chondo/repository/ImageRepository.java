package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.ImageEntity;

public interface ImageRepository extends JpaRepository<ImageEntity, Long>{
	List<ImageEntity> findByRoomTypeId(Long roomTypeId);
}
