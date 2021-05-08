package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.NewEntity;

public interface NewRepository extends JpaRepository<NewEntity, Long> {
	
}
