package com.chondo.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.entity.BookedRoomEntity;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.BookingStatusEntity;
import com.chondo.entity.CustomerEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.BookingStatusRepository;
import com.chondo.repository.CustomerRepository;
import com.chondo.repository.HotelRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IBookingService;
import com.chondo.util.LogUtil;

@Service
public class BookingService implements IBookingService{
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BookingStatusRepository bookingStatusRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeRepository;
	
	@Autowired
	private HotelRepository hotelRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private RoomStatusRepository roomStatusRepository;
	
	@Override
	@Transactional
	public BookingDTO save(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = new BookingEntity();
		if (booking.getCode()!=null) {
			bookingEntity = bookingRepository.findOneByCode(booking.getCode());
			bookingEntity.setStatus(bookingStatusRepository.findOneByCode("cancel"));
			List<BookedRoomEntity> bookedRoomEntities = bookingEntity.getBookedRooms();
			List<BookedRoomDTO> bookedRoomDTOs = modelMapper.map(bookedRoomEntities, new TypeToken<List<BookedRoomDTO>>(){}.getType());
			for (BookedRoomDTO bookedRoomDTO : bookedRoomDTOs) {
				RoomEntity roomEntity = roomRepository.findOne(bookedRoomDTO.getRoom().getId());
				roomEntity.setStatus(roomStatusRepository.findOneByCode("available"));
				roomRepository.save(roomEntity);
			}
			bookingEntity.setLogs(bookingEntity.getLogs() + LogUtil.createLog("cancel"));
		}else {
			bookingEntity = modelMapper.map(booking,BookingEntity.class);
			
			CustomerEntity customerEntity = customerRepository.findOne(booking.getCustomer().getId());
			bookingEntity.setCustomer(customerEntity);
			
			bookingEntity.setCode(getCode() + bookingRepository.count());
			bookingEntity.setStatus(bookingStatusRepository.findOneByCode("booked"));
			bookingEntity.setRoomType(roomTypeRepository.findOne(booking.getRoomType().getId()));
			bookingEntity.setHotel(hotelRepository.findOneByLocationAndStatus(booking.getHotel().getLocation(), 1));
			bookingEntity.setUpgraded(0);
			bookingEntity.setLogs(LogUtil.createLog("booked"));
			
		}
		
		bookingEntity = bookingRepository.save(bookingEntity);
		BookingDTO bookingDTO = modelMapper.map(bookingEntity, BookingDTO.class);
		if (booking.getIds()!=null) {
			bookingDTO.setIds(booking.getIds());
		}
		return bookingDTO;
	}
	

	
	private String getCode() {
		SimpleDateFormat formatter = new SimpleDateFormat("ddMMyyyy");  
	    Date date = new Date();  
	    return formatter.format(date);  
	}


	@Override
	public BookingDTO findOne(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOne(id);
		return	modelMapper.map(bookingEntity,BookingDTO.class);
	}



	@Override
	public BookingDTO findOneByCode(String bookingCode) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOneByCode(bookingCode);
		if (bookingEntity!=null) {
			return	modelMapper.map(bookingEntity,BookingDTO.class);
		}
		else return null;
	}



	@Override
	public BookingDTO findOneByBookedRoomsId(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOneByBookedRoomsId(id);
		return	modelMapper.map(bookingEntity,BookingDTO.class);
	}



	@Override
	public BookingDTO changeStatus(BookingDTO booking, String code) {
		ModelMapper modelMapper = new ModelMapper();
		BookingEntity bookingEntity = bookingRepository.findOne(booking.getId());
		BookingStatusEntity status = bookingStatusRepository.findOneByCode(code);
		bookingEntity.setStatus(status);
		bookingEntity.setLogs(bookingEntity.getLogs() + LogUtil.createLog(code));
		bookingRepository.save(bookingEntity);
		return	modelMapper.map(bookingEntity,BookingDTO.class);	
	}



	@Override
	public List<BookingDTO> findAll(Pageable pageable) {
		List<BookingEntity> entities = bookingRepository.findAll(pageable).getContent();
		ModelMapper modelMapper = new ModelMapper();
		List<BookingDTO> dtos = modelMapper.map(entities, new TypeToken<List<BookingDTO>>(){}.getType());
		return dtos;
	}



	@Override
	public Integer count() {
		return (int) bookingRepository.count();
	}


	@Override
	public List<BookingDTO> getBookingOfRoom(Integer number) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookingEntity> entities = bookingRepository.getBookingOfRoom(number);
		List<BookingDTO> bookings = modelMapper.map(entities, new TypeToken<List<BookingDTO>>(){}.getType());
		return bookings;
	}


}
