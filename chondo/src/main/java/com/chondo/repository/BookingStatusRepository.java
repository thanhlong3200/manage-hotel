package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.BookingStatusEntity;

public interface BookingStatusRepository extends JpaRepository<BookingStatusEntity, Long>{
	BookingStatusEntity findOneByCode(String code);
}
