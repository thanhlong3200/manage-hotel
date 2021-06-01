package com.chondo.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.chondo.entity.RoomEntity;

public interface ISearchService {
	List<RoomEntity> searchRoom(Date dateFrom,Date dateTo,Integer adult,Integer children,Integer roomCount,String locaion);
}
