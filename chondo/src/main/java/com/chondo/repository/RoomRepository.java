package com.chondo.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.chondo.entity.RoomEntity;

public interface RoomRepository extends JpaRepository<RoomEntity, Long> {
	List<RoomEntity> findByRoomTypeIdAndStatusCode(Long roomTypeId, String code);

	RoomEntity findOneByRoomTypeIdAndStatusCode(Long roomTypeId, String code);

	@Query(value = "select r.*\r\n" + "from rooms r join room_types rt on r.room_type_id = rt.id\r\n"
			+ "where r.room_type_id = :roomTypeId and r.hotel_id = :hotelId and r.id not in(\r\n"
			+ "select r.id from rooms r join booked_rooms br on br.room_id = r.id\r\n"
			+ "join room_status rs on rs.id = r.status_id\r\n" + "join bookings b on b.id = br.booking_id\r\n"
			+ "where r.hotel_id = :hotelId and rs.code <> 'available' \r\n"
			+"and ((b.date_from BETWEEN :dateFrom and subdate(:dateTo, 1))\r\n" + 
			"or (b.date_to BETWEEN :dateFrom+ INTERVAL 1 DAY and subdate(:dateTo, 1))\r\n" + 
			"or (b.date_from <= :dateFrom and b.date_to >= :dateTo)))", nativeQuery = true)
	List<RoomEntity> findAvailable(@Param("hotelId") Long hotelId, @Param("roomTypeId") Long roomTypeId,
			@Param("dateFrom") Date dateFrom, @Param("dateTo") Date dateTo);

	List<RoomEntity> findByRoomTypeId(Long roomTypeId);

	List<RoomEntity> findByRoomTypeCode(String roomTypeCode);

	@Query(value = "select r.* from rooms r join booked_rooms br on br.room_id = r.id\r\n" + 
			"			join room_status rs on rs.id = r.status_id \r\n" + 
			"			join bookings b on b.id = br.booking_id \r\n" + 
			"			where r.hotel_id = 1 and rs.code = 'booked'\r\n" + 
			"			and b.date_from = :date", nativeQuery = true)
	List<RoomEntity> findByBookedRoom(@Param("date") Date date);

	RoomEntity findOneByNumber(Integer number);
}
