package com.chondo.service;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Pageable;

import com.chondo.dto.BookingDTO;

public interface IBookingService {
	BookingDTO save(BookingDTO booking);

	BookingDTO findOne(Long id);

	BookingDTO findOneByCode(String bookingCode);

	BookingDTO findOneByBookedRoomsId(Long id);

	BookingDTO changeStatus(BookingDTO booking, String code);


	List<BookingDTO> findAll(Pageable pageable);

	Integer count();

	List<BookingDTO> getBookingOfRoom(Integer number);

	void setPrice(BookingDTO booking);

	List<BookingDTO> findByStatusCode(String statusCode, Pageable pageable);

	double countByStatusCode(String string);


	void createLog(String bookingCode, String logCode);

	List<BookingDTO> findByDateFromAndStatusCode(Date dateFilter, String status, Pageable pageable);

	List<BookingDTO> findByDateToAndStatusCode(Date dateFilter, String string, Pageable pageable);

	double countByDateToAndStatusCode(Date dateFilter, String string);

	double countByDateFromAndStatusCode(Date dateFilter, String string);

	BookingDTO extend(BookingDTO dto);

	List<BookingDTO> findByBookedRoomsCustomersCmnd(String cmnd);
	
	List<BookingDTO> findByCustomerId(Long id, Pageable pageable);
	
	BookingDTO sign(BookingDTO dto);
}
