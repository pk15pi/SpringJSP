package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

	@GetMapping({"/", "/home", "/"})
    public String home(HttpSession session) {
    	if (session.getAttribute("username") == null) {
    		return "login";
    	}else {
    		return "home"; // This resolves to /WEB-INF/views/home.jsp	
    	}
    }
}
