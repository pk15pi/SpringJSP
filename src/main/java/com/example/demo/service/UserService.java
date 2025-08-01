package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Users;

public interface UserService {
	Users getUserById(Long id);
	List<Users> getAllUsers();
	void deleteUserById(Long id);
	Users saveUser(Users user);
}
