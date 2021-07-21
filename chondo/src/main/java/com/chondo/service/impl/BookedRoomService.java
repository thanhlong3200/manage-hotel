package com.chondo.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.ServiceDTO;
import com.chondo.entity.BookedRoomEntity;
import com.chondo.entity.BookedServiceEntity;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.CustomerEntity;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.ServiceEntity;
import com.chondo.repository.BookedRoomRepository;
import com.chondo.repository.BookedServiceRepository;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.CustomerRepository;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.RoomStatusRepository;
import com.chondo.repository.ServiceRepository;
import com.chondo.service.IBookedRoomService;
import com.chondo.util.LogUtil;

@Service
public class BookedRoomService implements IBookedRoomService{
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private CustomerRepository customRepository;
		
	@Autowired
	private BookedRoomRepository bookedRoomRepository;
	
	@Autowired
	private RoomStatusRepository roomStatusRepository;

	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private RoomRepository roomRespository;
	
	@Autowired
	private BookedServiceRepository bookedServiceRepository;
	
	@Autowired
	private ServiceRepository serviceRepository;
	
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
	
		List<RoomDTO> rooms = new ArrayList<RoomDTO>();
		if (booking.getIds() == null) {
			List<RoomEntity> roomsEntity = roomRepository.findByRoomTypeIdAndStatusCode(booking.getRoomType().getId(), "available");
			rooms = modelMapper.map(roomsEntity, new TypeToken<List<RoomDTO>>(){}.getType());
		} else {
			for (long e : booking.getIds()) {
				RoomDTO roomDTO = modelMapper.map(roomRepository.findOne(e), RoomDTO.class);
				rooms.add(roomDTO);
			}
		}
			
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

	@Override
	public List<BookedRoomDTO> findByBookingId(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookedRoomEntity> entities = bookedRoomRepository.findByBookingId(id);
		return modelMapper.map(entities, new TypeToken<List<BookedRoomDTO>>(){}.getType());
	}

	@Override
	public List<BookedRoomDTO> setCustomers(List<BookedRoomDTO> bookedRooms) {
		ModelMapper modelMapper = new ModelMapper();
		
		List<BookedRoomEntity> bookedRoomEntities = new ArrayList<BookedRoomEntity>();
		
		for (BookedRoomDTO bookedRoomDTO : bookedRooms) {
			
			BookedRoomEntity entity = bookedRoomRepository.findOne(bookedRoomDTO.getId());
			
			for (CustomerDTO customer : bookedRoomDTO.getCustomers()) {
				if (customer.getCmnd() != null && customer.getCmnd() != "") {
					CustomerEntity customerEntity;
					if ((customerEntity = customRepository.findOneByCmnd(customer.getCmnd())) == null) {
						customerEntity = customRepository.save(modelMapper.map(customer, CustomerEntity.class));		
					}
					customerEntity.setCheckIn(1);
					customRepository.save(customerEntity);
					entity.getCustomers().add(customerEntity);
				}
						
			}
			RoomEntity roomEntity = entity.getRoom();
			roomEntity.setStatus(roomStatusRepository.findOneByCode("owned"));
			roomRespository.save(roomEntity);
			
			entity = bookedRoomRepository.save(entity);
			bookedRoomEntities.add(entity);
		}
		
	
		
		return  modelMapper.map(bookedRoomEntities, new TypeToken<List<BookedRoomDTO>>(){}.getType());
	}

	@Override
	public List<BookedRoomDTO> changeRoom(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookedRoomEntity> bookedRoomEntities = bookedRoomRepository.findByBookingCode(booking.getCode());
		List<BookedRoomDTO> listBookedRooms = modelMapper.map(bookedRoomEntities, new TypeToken<List<BookedRoomDTO>>(){}.getType());
		
		List<BookedRoomDTO> result = new ArrayList<BookedRoomDTO>();
		for (int i = 1; i < booking.getIds().length; i+=2) {
			if (booking.getIds()[i] != booking.getIds()[i-1]) {
				
				for (BookedRoomDTO bookedRoomDTO : listBookedRooms) {
					if (bookedRoomDTO.getRoom().getId() == (booking.getIds()[i-1])) {
						BookedRoomEntity bookedRoomEntity = bookedRoomRepository.findOne(bookedRoomDTO.getId());
						
						RoomEntity roomEntity = roomRepository.findOne(booking.getIds()[i]);
						bookedRoomEntity.setRoom(roomEntity);
						
						changeRoomStatus(roomEntity,"booked");
						
						
						RoomEntity oldRoomEntity = roomRepository.findOne(booking.getIds()[i-1]);
						
						changeRoomStatus(oldRoomEntity,"available");
						
						
						result.add(modelMapper.map((bookedRoomRepository.save(bookedRoomEntity)), BookedRoomDTO.class));
			

//						if ((modelMapper.map(roomEntity.getRoomType(), RoomTypeDTO.class)).getCode()
//								!= (modelMapper.map(oldRoomEntity.getRoomType(), RoomTypeDTO.class)).getCode()) {
//							upgradeBookedService(bookedRoomDTO.getId());
//						}
//						
						BookingEntity bookingEntity = bookingRepository.findOneByCode(booking.getCode());
						
						SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
					    Date date = new Date();  
					    String currentTime = formatter.format(date);
						bookingEntity.setLogs(bookingEntity.getLogs() + "Change room " + booking.getIds()[i-1]+ "->" +booking.getIds()[i] + " " + currentTime +"</br>");
						
						bookingRepository.save(bookingEntity);
					}
				}
				
				
				
				
			}
			
		}
		
		
		return result;
	}

private void changeRoomStatus(RoomEntity roomEntity, String code) {
	roomEntity.setStatus(roomStatusRepository.findOneByCode(code));
	roomRepository.save(roomEntity);
}

//	private void upgradeBookedService(Long id) {
//		ModelMapper modelMapper = new ModelMapper(); 
//		
//		List<BookedServiceEntity> bookedServiceEntities = bookedServiceRepository.findByBookedId(id);
//		List<BookedServiceDTO> bookedServiceDTOs = modelMapper.map(bookedServiceEntities, new TypeToken<List<BookedServiceDTO>>(){}.getType());
//		
//		BookingDTO bookingDTO = modelMapper.map(bookingRepository.findOneByBookedRoomsId(id), BookingDTO.class);
//		
//		List<ServiceEntity> serviceEntities = serviceRepository.findByRoomTypesId(bookingDTO.getRoomType().getId());
//		List<ServiceDTO> serviceDTOs = modelMapper.map(serviceEntities, new TypeToken<List<ServiceDTO>>(){}.getType());
//		
//		List<Long> createdServicesId = new ArrayList<Long>();	
//		for (BookedServiceDTO bookedServiceDTO : bookedServiceDTOs) {
//			createdServicesId.add(bookedServiceDTO.getService().getId());
//		}
//			
//		for (ServiceDTO serviceDTO : serviceDTOs) {
//			
//			if (!createdServicesId.contains(serviceDTO.getId())) {
//				BookedServiceEntity bookedServiceEntity = new BookedServiceEntity();
//				bookedServiceEntity.setBooked(bookedRoomRepository.findOne(id));
//				bookedServiceEntity.setFree(1);
//				bookedServiceEntity.setUsed(0);
//				bookedServiceEntity.setService(serviceRepository.findOne(serviceDTO.getId()));
//
//				bookedServiceRepository.save(bookedServiceEntity);
//			}
//			
//			
//		}
//	}

	@Override
	public List<BookedRoomDTO> findByBookingCode(String code) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookedRoomEntity> entities = bookedRoomRepository.findByBookingCode(code);
		return modelMapper.map(entities, new TypeToken<List<BookedRoomDTO>>(){}.getType());
	}

	@Override
	public BookedRoomDTO findOneByRoomId(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		BookedRoomEntity entity = bookedRoomRepository.findOneByRoomId(id);
		return modelMapper.map(entity, BookedRoomDTO.class);
	}

}
