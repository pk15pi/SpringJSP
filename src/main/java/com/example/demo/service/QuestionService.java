package com.example.demo.service;

import com.example.demo.entity.Question;
import java.util.List;

public interface QuestionService {
    List<Question> getAllQuestions();
    Question getQuestionById(Long id);
    Question saveQuestion(Question question);
    void deleteQuestion(Long id);
}
