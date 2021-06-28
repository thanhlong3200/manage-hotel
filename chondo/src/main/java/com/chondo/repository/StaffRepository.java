package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.StaffEntity;

public interface StaffRepository extends JpaRepository<StaffEntity, Long>{

	List<StaffEntity> findByStatusCode(String code);

}
