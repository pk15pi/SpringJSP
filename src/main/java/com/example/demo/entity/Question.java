package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "questions")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, name="NAME")
    private String name;   // Question name or text

    @Column(nullable = false, name="ADDED_ON")
    private LocalDateTime added_on = LocalDateTime.now();   // Date added

    @Column(nullable = false, name="ADDED_BY")
    private String added_by;   // Who added the question

    // Foreign Key to Subject
    @ManyToOne
    @JoinColumn(name = "SUBJECT_ID", nullable = false)
    private Subject subject;
}
