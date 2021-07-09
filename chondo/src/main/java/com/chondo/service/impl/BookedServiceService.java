package com.chondo.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.RoomDTO;
import com.chondo.dto.ServiceDTO;
import com.chondo.entity.BookedRoomEntity;
import com.chondo.entity.BookedServiceEntity;
import com.chondo.entity.ServiceEntity;
import com.chondo.repository.BookedRoomRepository;
import com.chondo.repository.BookedServiceRepository;
import com.chondo.repository.ServiceRepository;
import com.chondo.service.IBookedServiceService;

@Service
public class BookedServiceService implements IBookedServiceService{
	
	@Autowired
	private BookedServiceRepository bookedServiceRepository;
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private BookedRoomRepository bookedRoomRepository;
	
	
	@Override
	public BookedServiceDTO save(BookedServiceDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		BookedServiceEntity entity = modelMapper.map(dto,BookedServiceEntity.class);
		entity = bookedServiceRepository.save(entity);
		return modelMapper.map(entity, BookedServiceDTO.class);
	}

//	@Override
//	public List<BookedServiceDTO> setBookedServices(List<BookedRoomDTO> bookedRooms) {
//		List<BookedServiceDTO> list = new ArrayList<BookedServiceDTO>();
//		ModelMapper modelMapper = new ModelMapper();
//		for (BookedRoomDTO bookedRoomDTO : bookedRooms) {
//			BookedRoomEntity bookedRoomEntity = bookedRoomRepository.findOne(bookedRoomDTO.getId());	
//			List<ServiceEntity> serviceEntities = serviceRepository.findByRoomTypesId(bookedRoomEntity.getRoom().getRoomType().getId());
//			List<ServiceDTO> services = modelMapper.map(serviceEntities, new TypeToken<List<ServiceDTO>>(){}.getType());
//							
//			for (ServiceDTO service : services) {
//				
//				BookedServiceEntity bookedServiceEntity = new BookedServiceEntity();
//				
//				bookedServiceEntity.setBooked(bookedRoomEntity);
//				bookedServiceEntity.setFree(1);
//				bookedServiceEntity.setUsed(0);	
//				
//				ServiceEntity serviceEntity = serviceRepository.findOne(service.getId());
//				bookedServiceEntity.setService(serviceEntity);
//				
//				bookedServiceEntity = bookedServiceRepository.save(bookedServiceEntity);
//				
//				BookedServiceDTO dto =  modelMapper.map(bookedServiceEntity, BookedServiceDTO.class);
//				list.add(dto);
//			}	
//		}
//		return list;
//	}

	@Override
	public void replaceService(BookingDTO booking) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookedRoomEntity> bookedRoomEntities = bookedRoomRepository.findByBookingCode(booking.getCode());
		List<BookedRoomDTO> listBookedRooms = modelMapper.map(bookedRoomEntities, new TypeToken<List<BookedRoomDTO>>(){}.getType());
		for (int i = 0; i < listBookedRooms.size(); i++) {
			int countDiff = 0;
			for (int j = 0; j < booking.getIds().length; j++) {
				if (j%2==1) {
					if (listBookedRooms.get(i).getRoom().getId()!=booking.getIds()[j]) {
						countDiff++;
					}
				}
			}
			if (countDiff == listBookedRooms.size()) {
				
				List<BookedServiceEntity> bookedServiceEntities = bookedServiceRepository.findByBookedId(listBookedRooms.get(i).getId());
				List<BookedServiceDTO> bookedServiceDTOs = modelMapper.map(bookedServiceEntities, new TypeToken<List<BookedServiceDTO>>(){}.getType());
				for (BookedServiceDTO bookedServiceDTO : bookedServiceDTOs) {
					bookedServiceRepository.delete(bookedServiceDTO.getId());
				}
				
			}
		}
	}

	@Override
	public List<BookedServiceDTO> findByRangeDate(Date dateFrom, Date dateTo, String code) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookedServiceEntity> bookedServiceEntities = bookedServiceRepository.findByRangeDate(dateFrom,dateTo, code);
		List<BookedServiceDTO> bookedServiceDTOs = modelMapper.map(bookedServiceEntities, new TypeToken<List<BookedServiceDTO>>(){}.getType());
		return bookedServiceDTOs;
	}

	@Override
	public List<BookedServiceDTO> getAllService(String code) {
		ModelMapper modelMapper = new ModelMapper();
		List<BookedServiceEntity> bookedServiceEntities = bookedServiceRepository.getAllService(code);
		List<BookedServiceDTO> bookedServiceDTOs = modelMapper.map(bookedServiceEntities, new TypeToken<List<BookedServiceDTO>>(){}.getType());
		return bookedServiceDTOs;
	}
	
}
