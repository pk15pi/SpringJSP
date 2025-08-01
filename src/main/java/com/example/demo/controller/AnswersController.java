package com.example.demo.controller;

import com.example.demo.entity.Answers;
import com.example.demo.entity.Question;
import com.example.demo.service.AnswersService;
import com.example.demo.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/answers")
public class AnswersController {

    private final AnswersService AnswersService;
    private final QuestionService questionService;

    public AnswersController(AnswersService AnswersService, QuestionService questionService) {
        this.AnswersService = AnswersService;
        this.questionService = questionService;
    }

    @GetMapping("/")
    public String listAnswerss(Model model) {
        model.addAttribute("answer", AnswersService.getAllAnswers());
        model.addAttribute("questions", questionService.getAllQuestions());
        model.addAttribute("answer", new Answers());
        return "answer"; // /WEB-INF/views/Answerss.jsp
    }

    @PostMapping("/save")
    public String saveAnswers(@ModelAttribute Answers Answers, @RequestParam Long questionId) {
        Question question = questionService.getQuestionById(questionId);
        Answers.setQuestion(question);
        AnswersService.saveAnswers(Answers);
        return "redirect:/answers";
    }

    @GetMapping("/delete/{id}")
    public String deleteAnswers(@PathVariable Long id) {
        AnswersService.deleteAnswers(id);
        return "redirect:/answer";
    }

    @GetMapping("/edit/{id}")
    public String editAnswers(@PathVariable Long id, Model model) {
        model.addAttribute("answer", AnswersService.getAnswersById(id));
        model.addAttribute("questions", questionService.getAllQuestions());
        model.addAttribute("answer", AnswersService.getAllAnswers());
        return "answer";
    }
}
