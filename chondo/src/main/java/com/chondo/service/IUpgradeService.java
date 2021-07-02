package com.chondo.service;

import com.chondo.dto.BookingDTO;
import com.chondo.dto.UpgradeDTO;

public interface IUpgradeService {

	void upgrade(UpgradeDTO dto);

	UpgradeDTO findOneByBookingId(Long id);

}
