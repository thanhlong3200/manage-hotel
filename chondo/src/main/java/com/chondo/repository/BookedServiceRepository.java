package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.BookedServiceEntity;

public interface BookedServiceRepository extends JpaRepository<BookedServiceEntity , Long>{

}
