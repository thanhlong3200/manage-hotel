package com.chondo.api.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class test {
	public static void main(String[] args) throws ParseException {
		String dateFromStr = "31/05/2021";
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
        Date parsed = format.parse(dateFromStr);
        System.out.println(parsed); 
        java.sql.Date sql = new java.sql.Date(parsed.getTime());
		
		
		System.out.println(sql); 
	}
}
