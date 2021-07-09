package com.chondo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.entity.PaymentEntity;

public interface PaymentRepository extends JpaRepository<PaymentEntity, Long>{

	PaymentEntity findOneByBookingId(Long id);
	
	@Query(value = "SELECT * FROM payments \r\n" + 
			"where createddate BETWEEN :dateFrom and :dateTo ", nativeQuery = true)
	List<PaymentEntity> findByRangeDate(@Param("dateFrom") Date dateFrom, @Param("dateTo") Date dateTo);

}
