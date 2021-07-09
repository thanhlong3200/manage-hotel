package com.chondo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.entity.BookedServiceEntity;

public interface BookedServiceRepository extends JpaRepository<BookedServiceEntity , Long>{

	List<BookedServiceEntity> findByBookedId(Long id);
	
		
	@Query(value = "SELECT bs.* FROM booked_rooms br join bookings b\r\n" + 
			"on br.booking_id = b.id\r\n" + 
			"join bookeds_services bs on bs.booked_id = br.id\r\n" + 
			"join booking_status bst on bst.id = b.status_id\r\n" + 
			"WHERE bst.code = :code ", nativeQuery = true)
	List<BookedServiceEntity> getAllService(@Param("code")String code);

	@Query(value = "SELECT bs.* FROM booked_rooms br join bookings b\r\n" + 
			"on br.booking_id = b.id\r\n" + 
			"join bookeds_services bs on bs.booked_id = br.id\r\n" + 
			"join booking_status bst on bst.id = b.status_id\r\n" + 
			"WHERE bst.code = :code and bs.createddate BETWEEN :dateFrom and :dateTo ", nativeQuery = true)
	List<BookedServiceEntity> findByRangeDate(@Param("dateFrom") Date dateFrom, @Param("dateTo")Date dateTo, @Param("code")String code);

}
