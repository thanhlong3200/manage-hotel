package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.PaymentEntity;

public interface PaymentRepository extends JpaRepository<PaymentEntity, Long>{

	PaymentEntity findOneByBookingId(Long id);

}
