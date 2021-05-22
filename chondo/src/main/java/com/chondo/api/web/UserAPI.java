package com.chondo.api.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.UserDTO;
import com.chondo.service.IUserService;

@RestController(value = "userAPI")
public class UserAPI {
	@Autowired
	private IUserService userService;
	
	@PostMapping(value = "/api/user")
	@Transactional
	public UserDTO register(@RequestBody UserDTO userDTO) {
		return userService.save(userDTO);
	}
	
}
