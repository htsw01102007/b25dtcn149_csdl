CREATE DATABASE bai1_op;
USE bai1_op;

CREATE TABLE Class (
    class_id VARCHAR(20) PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    school_year INT NOT NULL
);

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    class_id VARCHAR(20),
    FOREIGN KEY(class_id) REFERENCES Class(class_id)
);