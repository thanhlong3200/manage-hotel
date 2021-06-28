package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.entity.BookingEntity;

public interface BookingRepository extends JpaRepository<BookingEntity, Long>{

	BookingEntity findOneByCode(String bookingCode);

	BookingEntity findOneByBookedRoomsId(Long id);
	
	@Query(value = "select b.* from rooms r join booked_rooms br on br.room_id = r.id\r\n" + 
			"join room_status rs on rs.id = r.status_id\r\n" + 
			"join bookings b on b.id = br.booking_id\r\n" + 
			"where r.hotel_id = 1 and rs.code <> 'available' and r.number = :number\r\n" + 
			"and b.date_from >= CURDATE()", nativeQuery = true)
	List<BookingEntity> getBookingOfRoom(@Param("number") Integer number);
	
}
