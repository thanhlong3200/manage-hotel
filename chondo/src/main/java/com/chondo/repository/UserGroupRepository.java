package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.UserGroupEntity;

public interface UserGroupRepository extends JpaRepository<UserGroupEntity, Long>{
	UserGroupEntity findOneById(Long groupId);
}
