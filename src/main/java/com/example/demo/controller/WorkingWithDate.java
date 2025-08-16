package com.example.demo.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/datetime")
public class WorkingWithDate {
	
	@RequestMapping({"/",""})
	public String returnDate() {
		return "datetime";
	}
	
	/*
	 * MM = month
	 * dd = day of month (1-31)
	 * DD = Day of Year (1-365)
	 * YYYY = Week year, not calendar year
	 * yyyy = Calendar year
	 * HH = hours (24-hour format)
	 * hh = hours (12-hour format)
	 * mm = minutes
	 * ss = seconds
	 */
	
	@ResponseBody
	@GetMapping("/date1")
	public String returnDate1() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-YYYY hh:mm:ss");
		// SimpleDateFormat works with java.util.Date, not with LocalDateTime.
		// But with some additon this can work with LocalDateTime
		Date date = Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant());
		return sdf.format(date);
	}
	
	@ResponseBody
	@GetMapping("/date2")
	public String returnDate2(@RequestParam("datetype") String datetype) {
		System.out.println(datetype);
		LocalDateTime dt = LocalDateTime.now();
		if (datetype.equals(null) || datetype.equals("")){
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm:ss");
		    return dt.format(formatter);
		}
		
		if (datetype.equals("MM")){
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM");
		    return dt.format(formatter);
		}
		
		if (datetype.equals("mm")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("mm");
			return dt.format(formatter);
		}
		
		if (datetype.equals("hh")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh");
			return dt.format(formatter);
		}
		
		if (datetype.equals("HH")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH");
			return dt.format(formatter);
		}
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy HH:mm:ss");
	    return dt.format(formatter);
	}
	
	

}
