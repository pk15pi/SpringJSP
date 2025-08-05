package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ajaxTest")
public class AjaxTestController {
	@GetMapping
	private String getPage() {
		return "ajaxOperation";
	}

}
