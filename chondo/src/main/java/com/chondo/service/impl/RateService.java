package com.chondo.service.impl;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chondo.dto.PaymentDTO;
import com.chondo.dto.RateDTO;
import com.chondo.dto.RoomTypeDTO;
import com.chondo.entity.RateEntity;
import com.chondo.repository.RateRepository;
import com.chondo.repository.RoomTypeRepository;
import com.chondo.service.IRateService;

@Service
public class RateService implements IRateService{

	@Autowired
	private RateRepository rateRepository;
	
	@Autowired
	private RoomTypeRepository roomTypeReposiory;
	
	@Override
	public void setRates(List<RoomTypeDTO> dtos) {
		for (RoomTypeDTO roomTypeDTO : dtos) {
			setRates(roomTypeDTO);
		}
	}

	@Override
	public void setRates(RoomTypeDTO roomtype) {
		List<RateEntity> entities = rateRepository.findByRoomTypeId(roomtype.getId());
		ModelMapper modelMapper = new ModelMapper();
		List<RateDTO> list = modelMapper.map(entities, new TypeToken<List<RateDTO>>(){}.getType());
		double sum = 0;
		for (RateDTO rate : list) {
			sum+=rate.getVote();
		}
		double avg = (double) Math.round((sum/list.size())*10) /10;
		roomtype.setAverageBadge(avg);
		roomtype.setRates(list);
		String rank = "Kém";
		if (avg >= 5.0 && avg < 6.5) {
			rank = "Trung bình";
		} else if (avg >= 6.5 && avg < 8.0) {
			rank = "Khá tốt";
		}else if (avg >= 8.0 && avg <9.5) {
			rank = "Tốt";
		} else if (avg>=9.5) {
			rank = "Tuyệt vời";
		}
		roomtype.setRank(rank);
	}

	@Override
	public List<RateDTO> findAll() {
		List<RateEntity> entities = rateRepository.findAll();
		ModelMapper modelMapper = new ModelMapper();
		List<RateDTO> list = modelMapper.map(entities, new TypeToken<List<RateDTO>>(){}.getType());
		return list;
	}

	@Override
	public RateDTO save(RateDTO dto) {
		ModelMapper modelMapper = new ModelMapper();
		RateEntity entity = modelMapper.map(dto, RateEntity.class);
		entity.setRoomType(roomTypeReposiory.findOne(dto.getRoomTypeId()));
		entity = rateRepository.save(entity);
		return modelMapper.map(entity, RateDTO.class);
	}
	
}
