package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
	UserEntity findOneByUsernameAndStatus(String username, int status);
	UserEntity findOneByUsername(String username);
	UserEntity findOneByEmail(String email);
	List<UserEntity> findByStatus(int i);
}
