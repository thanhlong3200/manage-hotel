package com.chondo.api.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.util.Calendar;
import java.util.Date;

public class test {
	public static void main(String[] args) throws ParseException {
//		String dateFromStr = "31/05/2021";
//		String dateToStr = "2/06/2021";
//		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//        Date dateFrom = format.parse(dateFromStr);
//        Date dateTo = format.parse(dateToStr);
//        long diff = dateTo.getTime() - dateFrom.getTime();
//		long count = diff / (1000 * 60 * 60 * 24);
//		System.out.println(count); 
//		String timeStamp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
//
//		Date dateTo = new Date();
//		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
//		Calendar calendar = Calendar.getInstance();
//		calendar.setTime(dateTo);
//		calendar.add(Calendar.DATE, 1);
//		dateTo = calendar.getTime();
//		format.format(dateTo);
//		System.out.println(dateTo);

		 Integer capacity = (int) Math.round((3 + (double) 3/2)/1);
		 System.out.println(capacity);
	}
}
