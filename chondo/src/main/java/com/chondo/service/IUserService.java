package com.chondo.service;

import com.chondo.dto.UserDTO;

public interface IUserService {
	UserDTO save(UserDTO userDTO);

	boolean existEmail(String email);

	boolean existUsername(String username);

	boolean checkPassword(String username, String password);

	UserDTO findOne(Long id);
	
}
