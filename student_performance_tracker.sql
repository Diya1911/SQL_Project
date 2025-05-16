
-- Student Performance Tracker SQL Project

-- Drop tables if they already exist
DROP TABLE IF EXISTS Marks;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Subjects;

-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    gender CHAR(1),
    class VARCHAR(10)
);

-- Create Subjects table
CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100)
);

-- Create Marks table
CREATE TABLE Marks (
    student_id INT,
    subject_id INT,
    marks_obtained INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- Insert sample data into Students
INSERT INTO Students (student_id, name, gender, class) VALUES
(1, 'Aarav Sharma', 'M', '10A'),
(2, 'Sneha Mehta', 'F', '10A'),
(3, 'Rohan Das', 'M', '10B'),
(4, 'Priya Iyer', 'F', '10B');

-- Insert sample data into Subjects
INSERT INTO Subjects (subject_id, subject_name) VALUES
(101, 'Mathematics'),
(102, 'Science'),
(103, 'English'),
(104, 'History');

-- Insert sample data into Marks
INSERT INTO Marks (student_id, subject_id, marks_obtained) VALUES
(1, 101, 78), (1, 102, 84), (1, 103, 75), (1, 104, 69),
(2, 101, 92), (2, 102, 88), (2, 103, 90), (2, 104, 85),
(3, 101, 45), (3, 102, 52), (3, 103, 48), (3, 104, 55),
(4, 101, 39), (4, 102, 42), (4, 103, 37), (4, 104, 50);

-- Query: Average marks per student
-- SELECT s.name, AVG(m.marks_obtained) AS avg_marks
-- FROM Students s
-- JOIN Marks m ON s.student_id = m.student_id
-- GROUP BY s.name;

-- Query: Top-performing student
-- SELECT s.name
-- FROM Students s
-- JOIN Marks m ON s.student_id = m.student_id
-- GROUP BY s.name
-- ORDER BY AVG(m.marks_obtained) DESC
-- LIMIT 1;

-- Query: Subjects in which students scored below 40
-- SELECT s.name, sub.subject_name, m.marks_obtained
-- FROM Students s
-- JOIN Marks m ON s.student_id = m.student_id
-- JOIN Subjects sub ON sub.subject_id = m.subject_id
-- WHERE m.marks_obtained < 40;

-- Create view for average performance
-- CREATE VIEW StudentAverage AS
-- SELECT s.student_id, s.name, AVG(m.marks_obtained) AS average_marks
-- FROM Students s
-- JOIN Marks m ON s.student_id = m.student_id
-- GROUP BY s.student_id, s.name;
