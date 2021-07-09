package com.chondo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.dto.PaymentTypeDTO;
import com.chondo.entity.PaymentEntity;
import com.chondo.entity.PaymentTypeEntity;

public interface PaymentTypeRepository extends JpaRepository<PaymentTypeEntity, Long>{
	PaymentTypeEntity findOneByCode(String code);

	List<PaymentTypeEntity> findByActive(int active);
	
	
}
