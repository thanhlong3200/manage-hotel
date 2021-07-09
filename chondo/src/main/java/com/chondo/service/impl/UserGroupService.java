package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.TaskDTO;
import com.chondo.dto.UserDTO;
import com.chondo.dto.UserGroupDTO;
import com.chondo.entity.TaskEntity;
import com.chondo.entity.UserEntity;
import com.chondo.entity.UserGroupEntity;
import com.chondo.repository.UserGroupRepository;
import com.chondo.service.IUserGroupService;

@Service
public class UserGroupService implements IUserGroupService{
	@Autowired
	private UserGroupRepository groupRepository;
	
	@Override
	public List<UserGroupDTO> findAll() {
		ModelMapper modelMapper = new ModelMapper();
		List<UserGroupEntity> entities = groupRepository.findAll();
		List<UserGroupDTO> dtos = modelMapper.map(entities, new TypeToken<List<UserGroupDTO>>(){}.getType());
		return dtos;
	}
	
}
