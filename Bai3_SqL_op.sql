CREATE DATABASE bai3_op;
USE bai3_op;

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL
);

CREATE TABLE Subject (
    subject_id VARCHAR(20) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT NOT NULL,
    chk_credit INT CHECK (credit > 0)
);

CREATE TABLE Enrollment (
    student_id VARCHAR(20),
    subject_id VARCHAR(20),
    register_date DATE NOT NULL,
    PRIMARY KEY (student_id, subject_id),
	FOREIGN KEY (student_id) REFERENCES Student(student_id),
	FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);