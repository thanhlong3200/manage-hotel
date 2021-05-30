package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUsernameAndStatus(String username, int status);
	UserEntity findOneByUsername(String username);
	UserEntity findOneByEmail(String email);
}
