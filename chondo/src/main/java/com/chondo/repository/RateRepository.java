package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.RateEntity;

public interface RateRepository extends JpaRepository<RateEntity, Long>{
	List<RateEntity> findByRoomTypeId(Long roomTypeId);
}
