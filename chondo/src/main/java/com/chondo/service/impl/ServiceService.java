package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.ServiceDTO;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.entity.ServiceEntity;
import com.chondo.repository.ServiceRepository;
import com.chondo.service.IServiceService;

@Service
public class ServiceService implements IServiceService{
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Override
	public void setServices(List<RoomTypeDTO> list) {
		for (RoomTypeDTO roomTypeDTO : list) {
			List<ServiceEntity> entities = serviceRepository.findByRoomTypesId(roomTypeDTO.getId());
			ModelMapper modelMapper = new ModelMapper();
			List<ServiceDTO> dtos = modelMapper.map(entities, new TypeToken<List<ServiceDTO>>(){}.getType());
			roomTypeDTO.setServices(dtos);
		}
		
	}
	
}
