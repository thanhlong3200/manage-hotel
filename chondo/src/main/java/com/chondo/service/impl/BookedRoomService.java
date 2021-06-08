package com.chondo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomStatusDTO;
import com.chondo.entity.BookedRoomEntity;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.repository.BookedRoomRepository;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.service.IBookedRoomService;

@Service
public class BookedRoomService implements IBookedRoomService{
	
	@Autowired
	private RoomRepository roomRepository;
		
	@Autowired
	private BookedRoomRepository bookedRoomRepository;
	
	@Autowired
	private RoomStatusRepository roomStatusRepository;

	@Autowired
	private BookingRepository bookingRepository;
	
	@Override
	public BookedRoomDTO save(BookedRoomDTO bookedRoom) {
		ModelMapper modelMapper = new ModelMapper();
		BookedRoomEntity entity = modelMapper.map(bookedRoom,BookedRoomEntity.class);
		entity = bookedRoomRepository.save(entity);
		return modelMapper.map(entity, BookedRoomDTO.class);
	}
	
	@Override
	@Transactional
	public List<BookedRoomDTO> setBookedRooms(BookingDTO booking) {
		List<BookedRoomDTO> list = new ArrayList<>();
		BookingEntity bookingEntity = bookingRepository.findOne(booking.getId());
		ModelMapper modelMapper = new ModelMapper();
		List<RoomEntity> roomsEntity = roomRepository.findByRoomTypeIdAndStatusCode(booking.getRoomType().getId(), "available");
		List<RoomDTO> rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		for (int i = 0; i < booking.getRoomCount(); i++) {
			BookedRoomEntity entity = new BookedRoomEntity();
			entity.setBooking(bookingEntity);
			RoomEntity room = roomRepository.findOne(rooms.get(i).getId());
			entity.setRoom(room);
			room.setStatus(roomStatusRepository.findOneByCode("booked"));	
			roomRepository.save(room);	
			entity = bookedRoomRepository.save(entity);
			BookedRoomDTO bookedRoom =  modelMapper.map(entity, BookedRoomDTO.class);		
			list.add(bookedRoom);
		}
		return list;
	}
	
}
