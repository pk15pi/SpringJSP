package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Users;
import com.example.demo.repo.UsersRepo;
import com.example.demo.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired UsersRepo usersRepo;

	@SuppressWarnings("deprecation")
	@Override
	public Users getUserById(Long id) {
		return usersRepo.getById(id);
	}

	@Override
	public List<Users> getAllUsers() {
		return usersRepo.findAll();
	}

	@Override
	public void deleteUserById(Long id) {
		usersRepo.deleteById(id);;
		
	}

	@Override
	public Users saveUser(Users user) {
		return usersRepo.save(user);
	}

}
