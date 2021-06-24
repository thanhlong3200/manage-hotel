package com.chondo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.BookedServiceEntity;

public interface BookedServiceRepository extends JpaRepository<BookedServiceEntity , Long>{

	List<BookedServiceEntity> findByBookedId(Long id);

}
