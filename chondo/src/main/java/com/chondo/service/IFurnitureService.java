package com.chondo.service;

import java.util.List;

import com.chondo.dto.FurnitureDTO;
import com.chondo.dto.RoomTypeDTO;

public interface IFurnitureService {
	void setFurnitures(List<RoomTypeDTO> dtos);
}
