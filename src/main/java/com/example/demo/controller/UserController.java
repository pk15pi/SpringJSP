package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Subject;
import com.example.demo.entity.Users;
import com.example.demo.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	@Autowired UserService userService;
	
	@GetMapping("/{id}")
	public Users userDetails(@PathVariable Long id) {
		return userService.getUserById(id);
	}
	
	@GetMapping("delete/{id}")
	public void deleteUser(@PathVariable Long id) {
		userService.deleteUserById(id);
	}
	
	@PostMapping("/save")
	public Users saveOrUpdate(@ModelAttribute Users user, @RequestParam(required=false) Long id) {

		Users existingUser = userService.getUserById(id);
        if (existingUser == null) {
        	throw new RuntimeException("User not found with id: " + id);
        }
        
        // Update only if the field is present in the request
        if (existingUser.getEmail() != null) {
            existingUser.setEmail(existingUser.getEmail());
        }
        if (existingUser.getPassword() != null) {
            existingUser.setPassword(existingUser.getPassword()); // hash before saving
        }
        if (existingUser.getRole() != null) {
            existingUser.setRole(existingUser.getRole());
        }
        if (existingUser.getAddress() !=null) {
        	existingUser.setAddress(existingUser.getAddress());
        }
        
        return userService.saveUser(existingUser);
	}
	
	

}
