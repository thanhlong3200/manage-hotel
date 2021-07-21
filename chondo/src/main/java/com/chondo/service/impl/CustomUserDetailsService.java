package com.chondo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.chondo.dto.MyUser;
import com.chondo.entity.RoleEntity;
import com.chondo.entity.UserEntity;
import com.chondo.entity.UserGroupEntity;
import com.chondo.repository.UserGroupRepository;
import com.chondo.repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserGroupRepository userGroupRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userEntity = userRepository.findOneByUsernameAndStatus(username, 1);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		UserGroupEntity groupEntity = userGroupRepository.findOneById(userEntity.getGroup().getId());
		for (RoleEntity role: groupEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		MyUser myUser = new MyUser(userEntity.getUsername(), userEntity.getPassword(), 
							true, true, true, true, authorities);
		myUser.setId(Long.toString(userEntity.getId()));
		myUser.setFullname(userEntity.getFullname());
		myUser.setAddress(userEntity.getAddress());
		myUser.setEmail(userEntity.getEmail());
		myUser.setPhone(userEntity.getPhone());
		myUser.setGender(userEntity.getGender());
		myUser.setBirthday(userEntity.getBirthday());
		return myUser;
	}

}
