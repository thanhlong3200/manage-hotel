package com.chondo.util;

import java.util.Date;

public class CalculateUtil {
	public static Long countNight(Date dateFrom, Date dateTo) {
		long diff = dateTo.getTime() - dateFrom.getTime();
		return diff / (1000 * 60 * 60 * 24);
	}
	
	public static Long totalPrice(Integer roomCount, Long price, Long countNight) {
		return roomCount * price * countNight;
	}
}
