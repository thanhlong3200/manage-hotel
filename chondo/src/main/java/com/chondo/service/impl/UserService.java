package com.chondo.service.impl;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.converter.UserConverter;
import com.chondo.dto.UserDTO;
import com.chondo.entity.UserEntity;
import com.chondo.entity.UserGroupEntity;
import com.chondo.repository.UserGroupRepository;
import com.chondo.repository.UserRepository;
import com.chondo.service.IUserService;

@Service
public class UserService implements IUserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserGroupRepository userGroupRepository;
	
	@Autowired
	private UserConverter userConverter;
	

	@Override
	public UserDTO save(UserDTO userDTO) {
		UserGroupEntity groupEntity = userGroupRepository.findOneById(userDTO.getGroupId());
		UserEntity userEntity = new UserEntity();
		userEntity = userConverter.toEntity(userDTO);
		userEntity.setBirthday(new Date(userDTO.getBirthday().getTime()));
		userEntity.setGroup(groupEntity);
		return userConverter.toDTO(userRepository.save(userEntity));
	}

	
}
