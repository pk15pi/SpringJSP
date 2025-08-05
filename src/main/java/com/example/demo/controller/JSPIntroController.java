package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/jsp", ""})
public class JSPIntroController {
	
	@GetMapping("/intro")
	private String intro() {
		return "jsp/intro";
	}
	
	@GetMapping("/forwarding")
	private String conditionalForwardingPage() {
		return "jsp/conditionalForwardingPage";
	}
	
	@GetMapping("/forwarded")
	private String forwarded() {
		return "jsp/forwarded";
	}
	
	@GetMapping("jspExpression")
	private String jspExpression() {
		return "jsp/jspExpression";
	}
}
