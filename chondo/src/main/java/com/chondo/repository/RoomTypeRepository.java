package com.chondo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.entity.RoomTypeEntity;
import com.chondo.entity.ServiceEntity;

public interface RoomTypeRepository extends JpaRepository<RoomTypeEntity, Long>{

	@Query( value =  "select rt.* \r\n" + 
			"from rooms r join room_types rt on r.room_type_id = rt.id\r\n" + 
			"where r.hotel_id = :hotelId and r.id not in(\r\n" + 
			"select r.id from rooms r join booked_rooms br on br.room_id = r.id\r\n" + 
			"join room_status rs on rs.id = r.status_id\r\n" + 
			"join bookings b on b.id = br.booking_id\r\n" + 
			"where r.hotel_id = :hotelId and rs.code = 'booked' \r\n" + 
			"and ((b.date_from BETWEEN subdate(:dateFrom, 1) and subdate(:dateTo, 1))\r\n" + 
			"or (b.date_to BETWEEN :dateFrom+ INTERVAL 1 DAY and subdate(:dateTo, 1))\r\n" + 
			"or (b.date_from <= :dateFrom and b.date_to >= :dateTo))) \r\n" + 
			"and rt.capacity >= :capacity\r\n" + 
			"GROUP BY r.room_type_id\r\n" + 
			"having COUNT(room_type_id) >= :roomCount \n#pageable\n", nativeQuery = true)
	List<RoomTypeEntity> findAvailable(@Param("hotelId") Long hotelId, @Param("roomCount") Integer roomCount,
				@Param("capacity") Integer capacity, @Param("dateFrom") Date dateFrom, @Param("dateTo") Date dateTo,
				Pageable pageable);

	List<RoomTypeEntity> findByStatus(Integer status, Pageable pageable);

	Integer countByStatus(Integer status);
	
}
