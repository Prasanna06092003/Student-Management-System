-- Create Tables
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    dept_id INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert Sample Data
INSERT INTO Departments VALUES (1, 'Computer Science'), (2, 'Electronics'), (3, 'Mechanical');

INSERT INTO Students VALUES 
(101, 'Alice', 20, 1, 85),
(102, 'Bob', 21, 2, 78),
(103, 'Charlie', 22, 1, 92),
(104, 'David', 20, 3, 67),
(105, 'Eve', 21, 2, 88);

-- Sample Queries

-- 1. List all students with department name
SELECT s.student_id, s.name, s.age, d.dept_name, s.marks
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id;

-- 2. Count of students in each department
SELECT d.dept_name, COUNT(*) AS student_count
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 3. Students with marks above 80
SELECT name, marks FROM Students WHERE marks > 80;

-- 4. Average marks per department
SELECT d.dept_name, AVG(s.marks) AS avg_marks
FROM Students s
JOIN Departments d ON s.dept_id = d.dept_id
GROUP BY d.dept_name;