package com.example.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Person;

@Controller
@RequestMapping("/jsn")
public class WorkingWithJson {
	
	@GetMapping({"/",""})
	private String servePage() {
		return "jsn";
	}
	
	/*
	 * In java, a JSON cant be created directly, For this we need to use MAP, a
	 * record or POJO. This will not work, Object x = {"name" : "Prasenjit", "title" : "Kushwaha"};
	 */
	@ResponseBody
	@GetMapping("/usingMAP")
	public Object serveJsonUsingMAP() {
	    Map<String, String> x = new HashMap<>();
	    x.put("name", "Prasenjit");
	    x.put("title", "Kushwaha");
	    return x; // Spring automatically converts this to JSON
	}
	
	// Using Map is easy and fast, but it is not caompatile with Spring’s JSON converter (Jackson).
	// Using POJO is recommended for safe type, and compatibility with Jackson.
	@ResponseBody
	@GetMapping("/usingPOJO")
	public Person serveJsonUsingPojo() {
		return new Person("Prasenjit", "Kushwaha");
		
	}
	

	public record Student(String name, String title) {}
	
	@ResponseBody
	@GetMapping("/usingRecord")
	public Student SupportedOn16AboveJavaOnly() {
	    return new Student("Prasenjit", "Kushwaha");
	}
	
}
