package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.StaffDTO;
import com.chondo.dto.StaffStatusDTO;
import com.chondo.entity.StaffEntity;
import com.chondo.entity.StaffStatusEntity;
import com.chondo.repository.StaffRepository;
import com.chondo.service.IStaffService;

@Service
public class StaffService implements IStaffService{
	
	@Autowired
	private StaffRepository staffRepository;

	@Override
	public List<StaffDTO> findByStatusCode(String code) {
		ModelMapper modelMapper = new ModelMapper();
		List<StaffEntity> entities = staffRepository.findByStatusCode(code);
		List<StaffDTO> dtos = modelMapper.map(entities, new TypeToken<List<StaffDTO>>(){}.getType());
		return dtos;
	}

}
