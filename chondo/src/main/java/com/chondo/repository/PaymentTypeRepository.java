package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.PaymentTypeEntity;

public interface PaymentTypeRepository extends JpaRepository<PaymentTypeEntity, Long>{
	PaymentTypeEntity findOneByCode(String code);
}
