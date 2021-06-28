package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.StaffStatusEntity;

public interface StaffStatusRepository extends JpaRepository<StaffStatusEntity, Long>{

	List<StaffStatusEntity> findByActive(int i);
	
}
