package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.HotelEntity;

public interface HotelRepository extends JpaRepository<HotelEntity, Long>{
	HotelEntity findOneByLocationAndStatus(String location, Integer status);

}
