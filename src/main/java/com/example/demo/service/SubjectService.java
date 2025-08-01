package com.example.demo.service;

import com.example.demo.entity.Subject;
import java.util.List;

public interface SubjectService {
    List<Subject> getAllSubjects();
    Subject getSubjectById(Long id);
    Subject saveSubject(Subject subject);
    void deleteSubject(Long id);
}
