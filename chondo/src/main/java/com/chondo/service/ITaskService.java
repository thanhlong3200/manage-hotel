package com.chondo.service;

import java.util.List;

import com.chondo.dto.TaskDTO;

public interface ITaskService {

	List<TaskDTO> findAll();
	
}
