package com.example.demo.service;

import com.example.demo.entity.Answers;
import java.util.List;

public interface AnswersService {
    List<Answers> getAllAnswers();
    Answers getAnsersById(Long id);
    Answers saveAnswers(Answers option);
    void deleteOption(Long id);
	List<Answers> getAnswers();
	Answers getAnswersById(Long id);
	void deleteAnswers(Long id);
}
