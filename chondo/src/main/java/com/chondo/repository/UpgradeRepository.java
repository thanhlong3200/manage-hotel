package com.chondo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chondo.entity.UpgradeEntity;

public interface UpgradeRepository extends JpaRepository<UpgradeEntity, Long>{

	UpgradeEntity findOneByBookingId(Long id);

}
