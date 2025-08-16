package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/resentity")
public class ResponseEnttController {
	
	private ResponseEntity<?> iHaveNoFixedReturnType1(@RequestParam(required=false) String what) {
		
		if("string".equals(what)) {
			return ResponseEntity.ok("I am returning String");
		} 
		
		if("object".equals(what)) {
			Map<Integer, String> x = new HashMap<>();
			x.put(1, "Hello");
			x.put(2, "Hi");
			return ResponseEntity.ok(x);
		}
		
		if("created".equals(what)) {
			return ResponseEntity.status(HttpStatus.CREATED).body("A plain string message");
		}
		
		return ResponseEntity.status(HttpStatus.NO_CONTENT).body("No data Found");
		
	}

}
