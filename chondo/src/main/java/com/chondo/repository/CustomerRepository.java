package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.CustomerEntity;

public interface CustomerRepository extends JpaRepository<CustomerEntity, Long>{
	CustomerEntity findOneByEmail(String email);

	CustomerEntity findOneByCmnd(String cmnd);
}
