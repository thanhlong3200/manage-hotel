package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.TaskEntity;

public interface TaskRepository extends JpaRepository<TaskEntity, Long>{
}
