package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.dto.PaymentTypeDTO;
import com.chondo.entity.PaymentTypeEntity;

public interface PaymentTypeRepository extends JpaRepository<PaymentTypeEntity, Long>{
	PaymentTypeEntity findOneByCode(String code);

	List<PaymentTypeEntity> findByActive(int active);
}
