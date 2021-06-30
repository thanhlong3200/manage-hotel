package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.ServiceEntity;

public interface ServiceRepository extends JpaRepository<ServiceEntity, Long>{
	List<ServiceEntity> findByRoomTypesId(Long roomTypeId);

	ServiceEntity findOneByCode(String code);
	
}
