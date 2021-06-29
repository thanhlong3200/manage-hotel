package com.chondo.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.service.IUpgradeService;

@RestController(value = "upgradeAPI")
public class UpgradeAPI {
	
	@Autowired
	private IUpgradeService upgradeService;
	
	@PostMapping(value = "/api/upgrade")
	@Transactional
	public UpgradeDTO upgrade(@RequestBody UpgradeDTO dto){	
		
		upgradeService.upgrade(dto);
		
		return dto;
	}
	
}