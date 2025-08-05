package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/contact")
public class ContactController {

    @GetMapping
    public String serveContactPage(HttpSession session, Model model) {
        model.addAttribute("name", "Prasenjit");
        return "contact";
    }
}

