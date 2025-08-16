package com.example.demo.dto;

public class Person {
    private String name;
    private String title;

    public Person() {
    }

    public Person(String name, String title) {
        this.name = name;
        this.title = title;
    }

    // Getters
    public String getName() {
        return name;
    }
    public String getTitle() {
        return title;
    }

    // Setters
    public void setName(String name) {
        this.name = name;
    }
    public void setTitle(String title) {
        this.title = title;
    }
}
