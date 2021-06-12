package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.PaymentStatusEntity;

public interface PaymentStatusRepository extends JpaRepository<PaymentStatusEntity, Long>{
	PaymentStatusEntity findOneByCode(String code);
}
