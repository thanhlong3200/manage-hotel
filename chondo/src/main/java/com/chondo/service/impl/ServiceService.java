package com.chondo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.BookedRoomDTO;
import com.chondo.dto.BookedServiceDTO;
import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.PaymentDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.ServiceDTO;
import com.chondo.entity.BookedServiceEntity;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.CustomerEntity;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.entity.ServiceEntity;
import com.chondo.repository.BookedRoomRepository;
import com.chondo.repository.BookedServiceRepository;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.ServiceRepository;
import com.chondo.service.IServiceService;

@Service
public class ServiceService implements IServiceService{
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private BookedServiceRepository bookedServiceRepository; 
	
	@Autowired
	private BookedRoomRepository bookedRoomRepository;
	
	@Override
	public void setServices(List<RoomTypeDTO> list) {
		for (RoomTypeDTO roomTypeDTO : list) {
			List<ServiceEntity> entities = serviceRepository.findByRoomTypesId(roomTypeDTO.getId());
			ModelMapper modelMapper = new ModelMapper();
			List<ServiceDTO> dtos = modelMapper.map(entities, new TypeToken<List<ServiceDTO>>(){}.getType());
			roomTypeDTO.setServices(dtos);
		}
		
	}

	@Override
	public List<ServiceDTO> findAll() {
		List<ServiceEntity> entities = serviceRepository.findAll();
		ModelMapper modelMapper = new ModelMapper();
		List<ServiceDTO> dtos = modelMapper.map(entities, new TypeToken<List<ServiceDTO>>(){}.getType());
		return dtos;
	}

	@Override
	public ServiceDTO findOneByCode(String code) {
		ModelMapper modelMapper = new ModelMapper();
		ServiceEntity entity = serviceRepository.findOneByCode(code);
		return modelMapper.map(entity, ServiceDTO.class);
	}

	@Override
	public BookedServiceDTO createBookedService(BookedRoomDTO bookedRoomDTO, String serviceCode) {
		BookingEntity bookingEntity = bookingRepository.findOneByBookedRoomsId(bookedRoomDTO.getId());
		
		ModelMapper modelMapper = new ModelMapper();
		BookingDTO bookingDTO = modelMapper.map(bookingEntity, BookingDTO.class);
		
		List<ServiceEntity> serviceEntities = serviceRepository.findByRoomTypesId(bookingDTO.getRoomType().getId());
		List<ServiceDTO> serviceDTOs = modelMapper.map(serviceEntities, new TypeToken<List<ServiceDTO>>(){}.getType());
		
		List<Long> freeServicesId = new ArrayList<Long>();	
		for (ServiceDTO freeService : serviceDTOs) {
			freeServicesId.add(freeService.getId());
		}
		
		ServiceEntity serviceEntity = serviceRepository.findOneByCode(serviceCode);
		ServiceDTO serviceDTO = modelMapper.map(serviceEntity, ServiceDTO.class);
		
		BookedServiceEntity bookedServiceEntity = new BookedServiceEntity();
		bookedServiceEntity.setBooked(bookedRoomRepository.findOne(bookedRoomDTO.getId()));
		bookedServiceEntity.setService(serviceRepository.findOne(serviceDTO.getId()));
		
		if (freeServicesId.contains(serviceDTO.getId())) {
			bookedServiceEntity.setFree(1);
		}else {
			bookedServiceEntity.setFree(0);
		}
		

		bookedServiceEntity = bookedServiceRepository.save(bookedServiceEntity);
		
		return modelMapper.map(bookedServiceEntity, BookedServiceDTO.class);
	}
	
}
