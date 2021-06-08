package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.BookingEntity;

public interface BookingRepository extends JpaRepository<BookingEntity, Long>{
	
}
