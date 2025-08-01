package com.example.demo.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entity.Answers;

public interface AnswersRepo extends JpaRepository<Answers, Long>{

}
