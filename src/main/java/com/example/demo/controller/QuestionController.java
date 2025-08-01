package com.example.demo.controller;

import com.example.demo.entity.Question;
import com.example.demo.entity.Subject;
import com.example.demo.service.QuestionService;
import com.example.demo.service.SubjectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/questions")
public class QuestionController {

    private final QuestionService questionService;
    private final SubjectService subjectService;

    public QuestionController(QuestionService questionService, SubjectService subjectService) {
        this.questionService = questionService;
        this.subjectService = subjectService;
    }

    @GetMapping
    public String listQuestions(Model model) {
        model.addAttribute("questions", questionService.getAllQuestions());
        model.addAttribute("subjects", subjectService.getAllSubjects());
        model.addAttribute("question", new Question());
        return "question"; // /WEB-INF/views/questions.jsp
    }

    @PostMapping("/save")
    public String saveQuestion(@ModelAttribute Question question, @RequestParam Long subjectId) {
        Subject subject = subjectService.getSubjectById(subjectId);
        question.setSubject(subject);
        questionService.saveQuestion(question);
        return "redirect:/question";
    }

    @GetMapping("/delete/{id}")
    public String deleteQuestion(@PathVariable Long id) {
        questionService.deleteQuestion(id);
        return "redirect:/question";
    }

    @GetMapping("/edit/{id}")
    public String editQuestion(@PathVariable Long id, Model model) {
        model.addAttribute("question", questionService.getQuestionById(id));
        model.addAttribute("subjects", subjectService.getAllSubjects());
        model.addAttribute("questions", questionService.getAllQuestions());
        return "question";
    }
}
