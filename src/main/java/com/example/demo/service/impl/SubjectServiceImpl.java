package com.example.demo.service.impl;

import com.example.demo.entity.Subject;
import com.example.demo.repo.SubjectRepo;
import com.example.demo.service.SubjectService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {

    private final SubjectRepo subjectRepo;

    public SubjectServiceImpl(SubjectRepo subjectRepo) {
        this.subjectRepo = subjectRepo;
    }

    @Override
    public List<Subject> getAllSubjects() {
        return subjectRepo.findAll();
    }

    @Override
    public Subject getSubjectById(Long id) {
        return subjectRepo.findById(id).orElse(null);
    }

    @Override
    public Subject saveSubject(Subject subject) {
        return subjectRepo.save(subject);
    }

    @Override
    public void deleteSubject(Long id) {
        subjectRepo.deleteById(id);
    }
}
