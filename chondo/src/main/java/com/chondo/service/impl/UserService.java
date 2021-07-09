package com.chondo.service.impl;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.converter.UserConverter;
import com.chondo.dto.TaskDTO;
import com.chondo.dto.UserDTO;
import com.chondo.entity.TaskEntity;
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
	@Transactional
	public UserDTO save(UserDTO userDTO) {
			UserGroupEntity groupEntity = userGroupRepository.findOneById(userDTO.getGroupId());
			UserEntity userEntity = new UserEntity();
			if (userDTO.getId() == null) {
				userEntity = userConverter.toEntity(userDTO);
				userEntity.setBirthday(new Date(userDTO.getBirthday().getTime()));
				userEntity.setGroup(groupEntity);
				
			} else {
				UserEntity oldUser = userRepository.findOne(userDTO.getId()); 
				oldUser.setBirthday(new Date(userDTO.getBirthday().getTime()));
				oldUser.setGroup(groupEntity);
				userEntity = userConverter.toEntity(oldUser, userDTO);
			}
			return userConverter.toDTO(userRepository.save(userEntity));
		
	}

	@Override
	public boolean existUsername(String username) {
		return userRepository.findOneByUsername(username) != null;
	}

	@Override
	public boolean existEmail(String email) {
		return userRepository.findOneByEmail(email) != null;
	}
	
	@Override
	public boolean checkPassword(String username, String password) {
		return userRepository.findOneByUsername(username).getPassword().equalsIgnoreCase(password);
	}
	
	@Override
	public UserDTO findOne(Long id) {
		UserEntity entity = userRepository.findOne(id);
		return userConverter.toDTO(entity);
	}

	@Override
	public List<UserDTO> findByStatus(int i) {
		ModelMapper modelMapper = new ModelMapper();
		List<UserEntity> entities = userRepository.findByStatus(i);
		List<UserDTO> dtos = modelMapper.map(entities, new TypeToken<List<UserDTO>>(){}.getType());
		return dtos;
	}
}
