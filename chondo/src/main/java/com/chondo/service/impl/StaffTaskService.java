package com.chondo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.chondo.dto.PaymentDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.dto.StaffTaskDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.RoomTypeEntity;
import com.chondo.entity.StaffEntity;
import com.chondo.entity.StaffTaskEntity;
import com.chondo.entity.TaskEntity;
import com.chondo.repository.RoomRepository;
import com.chondo.repository.StaffRepository;
import com.chondo.repository.StaffTaskRepository;
import com.chondo.repository.TaskRepository;
import com.chondo.service.IStaffTaskService;

@Service
public class StaffTaskService implements IStaffTaskService{
	
	@Autowired
	private StaffRepository staffRepository;
	
	@Autowired
	private TaskRepository taskRepository;
	
	@Autowired
	private RoomRepository roomRepository;
	
	@Autowired
	private StaffTaskRepository staffTaskRepository;
	

	@Override
	public List<StaffTaskDTO> findAll(Pageable pageable) {
		List<StaffTaskEntity> entities = staffTaskRepository.findAll(pageable).getContent(); 
		ModelMapper modelMapper = new ModelMapper();
		List<StaffTaskDTO> dtos = modelMapper.map(entities, new TypeToken<List<StaffTaskDTO>>(){}.getType());
		return dtos;
	}

	@Override
	public Long count() {
		return staffTaskRepository.count();
	}

	@Override
	public StaffTaskDTO assignTask(StaffTaskDTO dto) {

		StaffTaskEntity entity = new StaffTaskEntity();
		
		StaffEntity staffEntity = staffRepository.findOne(dto.getStaff().getId());
		entity.setStaff(staffEntity);
		
		RoomEntity roomEntity = roomRepository.findOne(dto.getRoom().getId());
		entity.setRoom(roomEntity);
		
		TaskEntity taskEntity = taskRepository.findOne(dto.getTask().getId());
		entity.setTask(taskEntity);
		
		entity.setDone(0);
		
		entity = staffTaskRepository.save(entity);
		
		ModelMapper modelMapper = new ModelMapper();
	
		return  modelMapper.map(entity, StaffTaskDTO.class);
	}

}
