package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "ANSWERS")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Answers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, name="OPTION")
    private String option;   // Option text

    @Column(nullable = false, name="IS_CORRECT")
    private boolean is_correct;   // Whether it's the correct answer

    // Foreign key to Question
    @ManyToOne
    @JoinColumn(name = "QUESTION_ID", nullable = false)
    private Question question;
}
