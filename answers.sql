DROP DATABASE IF EXISTS CollegeDB;
CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(20) NOT NULL,
    Gender VARCHAR(10),
    DepartmentID INT
);
desc Student;

insert Student values("1001","Arun","Male","101"),("1002","Divya","Female","102"),("1003","Karthik","Male","101");
select * from Student;
