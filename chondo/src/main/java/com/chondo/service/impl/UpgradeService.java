package com.chondo.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.CustomerDTO;
import com.chondo.dto.UpgradeDTO;
import com.chondo.entity.BookingEntity;
import com.chondo.entity.UpgradeEntity;
import com.chondo.repository.BookingRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.repository.UpgradeRepository;
import com.chondo.service.IUpgradeService;

@Controller
public class UpgradeService implements IUpgradeService{
	
	@Autowired
	private BookingRepository bookingRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeRepository; 
	
	@Autowired
	private UpgradeRepository upgradeRepository;
	
	@Override
	public void upgrade(UpgradeDTO dto) {
		UpgradeEntity upgradeEntity = new UpgradeEntity();
		
		BookingEntity bookingEntity = bookingRepository.findOneByCode(dto.getBooking().getCode());
		
		upgradeEntity.setInitRoomType(bookingEntity.getRoomType());
		
		bookingEntity.setRoomType(roomTypeRepository.findOne(dto.getInitRoomType().getId()));
		
		bookingEntity.setUpgraded(1);
		bookingRepository.save(bookingEntity);
		
		upgradeEntity.setBooking(bookingEntity);
		
		upgradeEntity.setFree(dto.getFree());
		
		upgradeRepository.save(upgradeEntity);
		
		
	}

	@Override
	public UpgradeDTO findOneByBookingId(Long id) {
		ModelMapper modelMapper = new ModelMapper();
		UpgradeEntity entity = upgradeRepository.findOneByBookingId(id);
		if (entity==null) {
			return null;
		}
		return modelMapper.map(entity, UpgradeDTO.class);
	}

}
