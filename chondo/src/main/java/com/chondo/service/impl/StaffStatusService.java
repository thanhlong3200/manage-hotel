package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomStatusDTO;
import com.chondo.dto.StaffStatusDTO;
import com.chondo.entity.RoomStatusEntity;
import com.chondo.entity.StaffStatusEntity;
import com.chondo.repository.StaffStatusRepository;
import com.chondo.service.IStaffStatusService;

@Service
public class StaffStatusService implements IStaffStatusService{
	
	@Autowired
	private StaffStatusRepository staffStatusRepository;

	@Override
	public List<StaffStatusDTO> findByActive(int i) {
		ModelMapper modelMapper = new ModelMapper();
		List<StaffStatusEntity> entities = staffStatusRepository.findByActive(i);
		List<StaffStatusDTO> dtos = modelMapper.map(entities, new TypeToken<List<StaffStatusDTO>>(){}.getType());
		return dtos;
	}

}
