package com.example.demo.service.impl;

import com.example.demo.entity.Answers;
import com.example.demo.repo.AnswersRepo;
import com.example.demo.service.AnswersService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class AnswersServiceImpl implements AnswersService {

    private final AnswersRepo AnswersRepo;

    public AnswersServiceImpl(AnswersRepo AnswersRepo) {
        this.AnswersRepo = AnswersRepo;
    }

    @Override
    public List<Answers> getAnswers() {
        return AnswersRepo.findAll();
    }

    @Override
    public Answers getAnswersById(Long id) {
        return AnswersRepo.findById(id).orElse(null);
    }

    @Override
    public Answers saveAnswers(Answers Answers) {
        return AnswersRepo.save(Answers);
    }

    @Override
    public void deleteAnswers(Long id) {
        AnswersRepo.deleteById(id);
    }

	@Override
	public List<Answers> getAllAnswers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Answers getAnsersById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteOption(Long id) {
		// TODO Auto-generated method stub
		
	}

}
