package com.chondo.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LogUtil {
	public static String createLog(String code) {
		String log = "";
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    String currentTime = formatter.format(date);
	    
		switch (code) {
		case "checkin":
			log = "Check-in: " + currentTime + "</br>";
			break;
		case "checkout":
			log = "Check-out: " + currentTime+ "</br>";
			break;
		case "upgrade":
			log = "Upgrade: " + currentTime + "</br>";
			break;
		case "booked":
			log = "Book: " + currentTime+ "</br>";
			break;
		case "cancel":
			log = "Cancel: " + currentTime+ "</br>";
			break;
		case "verify":
			log = "Verify: " + currentTime+ "</br>";
			break;
		default:
			break;
		}
		
		return log;
	}
}
