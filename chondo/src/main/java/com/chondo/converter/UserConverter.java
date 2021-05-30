package com.chondo.converter;

import org.springframework.stereotype.Component;

import com.chondo.dto.UserDTO;
import com.chondo.entity.UserEntity;

@Component
public class UserConverter {
	public UserDTO toDTO(UserEntity entity) {
		UserDTO dto = new UserDTO();
		dto.setId(entity.getId());
		dto.setUsername(entity.getUsername());
		dto.setPassword(entity.getPassword());
		dto.setFullname(entity.getFullname());
		dto.setEmail(entity.getEmail());
		dto.setPhone(entity.getPhone());
		dto.setAddress(entity.getAddress());
		dto.setGender(entity.getGender());
		dto.setStatus(entity.getStatus());
		dto.setBirthday(entity.getBirthday());
		dto.setGroupId(entity.getGroup().getId());
		return dto;
	}
	
	public UserEntity toEntity(UserDTO dto) {
		UserEntity entity = new UserEntity();
		entity.setUsername(dto.getUsername());
		entity.setPassword(dto.getPassword());
		entity.setFullname(dto.getFullname());
		entity.setEmail(dto.getEmail());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setGender(dto.getGender());
		entity.setStatus(dto.getStatus());
		return entity;
	}
	
	public UserEntity toEntity(UserEntity entity, UserDTO dto) {
		entity.setUsername(dto.getUsername());
		entity.setPassword(dto.getPassword());
		entity.setFullname(dto.getFullname());
		entity.setEmail(dto.getEmail());
		entity.setPhone(dto.getPhone());
		entity.setAddress(dto.getAddress());
		entity.setGender(dto.getGender());
		entity.setStatus(dto.getStatus());
		return entity;
	}
}
