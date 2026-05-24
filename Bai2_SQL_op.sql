CREATE DATABASE bai2_op;
USE bai2_op;

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    CONSTRAINT uq_student_id UNIQUE (student_id)
);

CREATE TABLE Subject (
    subject_id VARCHAR(20) PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT NOT NULL,
    CONSTRAINT uq_subject_id UNIQUE (subject_id),
    CONSTRAINT chk_credit CHECK (credit > 0)
);