package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.entity.BookedRoomEntity;

public interface BookedRoomRepository extends JpaRepository<BookedRoomEntity, Long>{

	List<BookedRoomEntity> findByBookingId(Long id);

	List<BookedRoomEntity> findByBookingCode(String code);
	
	@Query(value = "SELECT br.* FROM booked_rooms br JOIN bookings b\r\n" + 
			"on br.booking_id = b.id\r\n" + 
			"join booking_status bs on bs.id = b.status_id\r\n" + 
			"join rooms r on br.room_id = r.id\r\n" + 
			"where bs.code = 'checkin' and r.id = :id", nativeQuery = true)
	BookedRoomEntity findOneByRoomId(@Param("id") Long id);
	
}
