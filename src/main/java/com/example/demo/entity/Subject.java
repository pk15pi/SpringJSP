package com.example.demo.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "SUBJECTS")
@Data                      // Generates getters, setters, toString, equals, hashCode
@NoArgsConstructor         // Generates a no-arg constructor
@AllArgsConstructor        // Generates a constructor with all fields
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, name="NAME")
    private String name;
    
    @Column(name="ADDED_ON")
    private LocalDateTime added_on=LocalDateTime.now(); 
}
