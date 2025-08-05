package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.entity.Question;
import com.example.demo.entity.Subject;
import com.example.demo.entity.Answers;
import com.example.demo.service.AnswersService;
import com.example.demo.service.QuestionService;
import com.example.demo.service.SubjectService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/quiz")
public class SubmitQuiz {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private AnswersService answersService;

    @GetMapping
    public String quizPage(Model model) {
        model.addAttribute("question", new Question());
        model.addAttribute("subjects", subjectService.getAllSubjects());

        model.addAttribute("option1", new Answers());
        model.addAttribute("option2", new Answers());
        model.addAttribute("option3", new Answers());
        model.addAttribute("option4", new Answers());

        return "submitQuiz";
    }

    @PostMapping("/save")
    public String saveQuestion(HttpSession session,
                               @RequestParam String questionText,
                               @RequestParam Long subjectId,
                               @RequestParam("optionTexts") String[] optionTexts,
                               @RequestParam("correctIndex") int correctIndex) {

        Question question = new Question();
        question.setName(questionText);

        Subject subject = subjectService.getSubjectById(subjectId);
        question.setSubject(subject);

        question.setAdded_by(session.getAttribute("username").toString());

        // Save the question first
        question = questionService.saveQuestion(question);

        // Create and save answers
        for (int i = 0; i < optionTexts.length; i++) {
            Answers answer = new Answers();
            answer.setOption(optionTexts[i]);
            answer.set_correct(i == correctIndex);
            answer.setQuestion(question);
            answersService.saveAnswers(answer);
        }

        return "redirect:/quiz";
    }
}
