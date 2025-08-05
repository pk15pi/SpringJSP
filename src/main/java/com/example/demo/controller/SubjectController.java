package com.example.demo.controller;

import com.example.demo.entity.Subject;
import com.example.demo.service.SubjectService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/subjects")
public class SubjectController {

    private final SubjectService subjectService;

    public SubjectController(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @GetMapping
    public String listSubjects(Model model) {
        model.addAttribute("subjects", subjectService.getAllSubjects());
        model.addAttribute("subject", new Subject());
        return "subject"; // /WEB-INF/views/subjects.jsp
    }
    
    @GetMapping("/list")
    @ResponseBody
    public List<Subject> listOfSubjects(Model model) { 
        return subjectService.getAllSubjects(); // /WEB-INF/views/subjects.jsp
    }

    @PostMapping("/save")
    public String saveSubject(@ModelAttribute Subject subject) {
        subjectService.saveSubject(subject);
        return "redirect:/subjects";
    }

    @PostMapping("/save-rb")
    @ResponseBody
    public Subject saveSubjectResb(@ModelAttribute Subject subject) {
        Subject x = subjectService.saveSubject(subject);
        return x;
    }
    
    @GetMapping("/delete/{id}")
    public String deleteSubject(@PathVariable Long id) {
        subjectService.deleteSubject(id);
        return "redirect:/subjects";
    }

    @GetMapping("/edit/{id}")
    public String editSubject(@PathVariable Long id, Model model) {
        model.addAttribute("subject", subjectService.getSubjectById(id));
        model.addAttribute("subjects", subjectService.getAllSubjects());
        return "subject";
    }
}
