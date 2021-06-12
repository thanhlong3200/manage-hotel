package com.chondo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
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

	@Override
	public List<BookedServiceDTO> setBookedServices(List<BookedRoomDTO> bookedRooms) {
		List<BookedServiceDTO> list = new ArrayList<BookedServiceDTO>();
		ModelMapper modelMapper = new ModelMapper();
		for (BookedRoomDTO bookedRoomDTO : bookedRooms) {
			List<ServiceEntity> serviceEntities = serviceRepository.findByRoomTypesId(bookedRoomDTO.getRoom().getRoomType().getId());
			List<ServiceDTO> services = modelMapper.map(serviceEntities, new TypeToken<List<ServiceDTO>>(){}.getType());
			
			BookedRoomEntity bookedRoomEntity = bookedRoomRepository.findOne(bookedRoomDTO.getId());	
					
			for (ServiceDTO service : services) {
				
				BookedServiceEntity bookedServiceEntity = new BookedServiceEntity();
				
				bookedServiceEntity.setBooked(bookedRoomEntity);
				bookedServiceEntity.setFree(1);
				bookedServiceEntity.setUsed(0);	
				
				ServiceEntity serviceEntity = serviceRepository.findOne(service.getId());
				bookedServiceEntity.setService(serviceEntity);
				
				bookedServiceEntity = bookedServiceRepository.save(bookedServiceEntity);
				
				BookedServiceDTO dto =  modelMapper.map(bookedServiceEntity, BookedServiceDTO.class);
				list.add(dto);
			}	
		}
		return list;
	}
	
}
