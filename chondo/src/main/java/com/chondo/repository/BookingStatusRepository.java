package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.BookingStatusEntity;

public interface BookingStatusRepository extends JpaRepository<BookingStatusEntity, Long>{
	BookingStatusEntity findOneByCode(String code);

	List<BookingStatusEntity> findByActive(int i);
}
