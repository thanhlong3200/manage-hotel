package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.RoomDTO;
import com.chondo.dto.TaskDTO;
import com.chondo.entity.RoomEntity;
import com.chondo.entity.TaskEntity;
import com.chondo.repository.TaskRepository;
import com.chondo.service.ITaskService;

@Service
public class TaskService implements ITaskService{
	
	@Autowired
	private TaskRepository taskRepository;
	@Override
	public List<TaskDTO> findAll() {
		ModelMapper modelMapper = new ModelMapper();
		List<TaskEntity> entities = taskRepository.findAll();
		List<TaskDTO> dtos = modelMapper.map(entities, new TypeToken<List<TaskDTO>>(){}.getType());
		return dtos;
	}
	
}
