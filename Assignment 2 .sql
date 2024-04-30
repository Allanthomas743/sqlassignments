CREATE TABLE Courses (
    courseid INT PRIMARY KEY,
    coursename VARCHAR(255),
    credits INT,
    teacherid INT
);
INSERT INTO Courses (courseid, coursename, credits, teacherid) VALUES 
(1, 'Mathematics', 4, 101),
(2, 'English Literature', 3, 102),
(3, 'Computer Science', 3, 103),
(4, 'History', 3, 104),
(5, 'Biology', 4, 105),
(6, 'Physics', 4, 106),
(7, 'Chemistry', 4, 107),
(8, 'Art', 2, 108),
(9, 'Economics', 3, 109),
(10, 'Music', 2, 110);
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

Copy code
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES 
(1, 1, '2024-04-30'),
(2, 2, '2024-04-30'),
(3, 3, '2024-04-30'),
(4, 4, '2024-04-30'),
(5, 5, '2024-04-30'),
(1, 6, '2024-04-30'),
(2, 7, '2024-04-30'),
(3, 8, '2024-04-30'),
(4, 9, '2024-04-30'),
(5, 10, '2024-04-30');

Copy code
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Payments (student_id, amount, payment_date) VALUES 
(1, 100.00, '2024-04-30'),
(2, 150.00, '2024-04-30'),
(3, 200.00, '2024-04-30'),
(4, 120.00, '2024-04-30'),
(5, 180.00, '2024-04-30'),
(1, 90.00, '2024-04-30'),
(2, 140.00, '2024-04-30'),
(3, 210.00, '2024-04-30'),
(4, 130.00, '2024-04-30'),
(5, 170.00, '2024-04-30');
CREATE TABLE Students (
    studentid INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    date_of_birth DATE,
    email VARCHAR(255),
    phone_number VARCHAR(20)
);
INSERT INTO Students (firstname, lastname, date_of_birth, email, phone_number) VALUES 
('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890'),
('Alice', 'Smith', '1998-05-20', 'alice.smith@example.com', '9876543210'),
('Michael', 'Johnson', '1997-10-12', 'michael.johnson@example.com', '4567890123'),
('Emily', 'Brown', '1996-03-25', 'emily.brown@example.com', '7890123456'),
('David', 'Taylor', '1999-12-03', 'david.taylor@example.com', '3210987654'),
('Sarah', 'Anderson', '1994-07-18', 'sarah.anderson@example.com', '6543210987'),
('Matthew', 'Thomas', '1997-09-29', 'matthew.thomas@example.com', '2109876543'),
('Emma', 'Martinez', '1998-11-07', 'emma.martinez@example.com', '5432109876'),
('Olivia', 'Garcia', '1996-04-14', 'olivia.garcia@example.com', '8765432109'),
('Daniel', 'Wilson', '1995-01-30', 'daniel.wilson@example.com', '4321098765');
CREATE TABLE Teachers (
    teacherid INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255)
);
INSERT INTO Teachers (firstname, lastname, email) VALUES 
('Michael', 'Johnson', 'michael.johnson@example.com'),
('Alice', 'Smith', 'alice.smith@example.com'),
('Emily', 'Brown', 'emily.brown@example.com'),
('David', 'Taylor', 'david.taylor@example.com'),
('Sarah', 'Anderson', 'sarah.anderson@example.com'),
('Matthew', 'Thomas', 'matthew.thomas@example.com'),
('Emma', 'Martinez', 'emma.martinez@example.com'),
('Olivia', 'Garcia', 'olivia.garcia@example.com'),
('Daniel', 'Wilson', 'daniel.wilson@example.com'),
('Sophia', 'Lopez', 'sophia.lopez@example.com');
use Student_Information_System;
Select * from Courses;
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
Select * from Teacher;
INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES ('6', '6', '2024-04-26');
UPDATE Teacher
SET email = 'emily@example.com'
WHERE teacher_id = 4;

DELETE FROM Enrollments
WHERE student_id = 6 AND course_id = 2;
UPDATE Courses
SET teacher_id = 2
WHERE course_id = 6;
DELETE FROM Students
WHERE student_id = 3;

DELETE FROM Enrollments
WHERE student_id = 3;
UPDATE Payments
SET amount = 400
WHERE payment_id = 1;

-- task-3
SELECT SUM(amount) AS total_payments
FROM Payments
WHERE student_id = 2;

SELECT Courses.course_name, COUNT(Enrollments.student_id) AS student_count
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_id, Courses.course_name;

SELECT Students.student_name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.student_id IS NULL;

SELECT Students.first_name, Students.last_name, Courses.course_name
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;

SELECT Teacher.teacher_name, Courses.course_name
FROM Teacher
JOIN Courses ON Teacher.teacher_id = Courses.teacher_id;

SELECT Students.student_name, Enrollments.enrollment_date
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_name = 'Mathematics';

SELECT Students.student_name
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.payment_id IS NULL;

SELECT Courses.course_name
FROM Courses
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
WHERE Enrollments.course_id IS NULL;

-- task-4
SELECT AVG(student_count) AS average_students_per_course
FROM (
    SELECT COUNT(*) AS student_count
    FROM Enrollments
    GROUP BY course_id
) AS enrollment_counts;


SELECT student_id, amount
FROM Payments
WHERE amount = (SELECT MAX(amount) FROM Payments);

SELECT course_id, COUNT(*) AS enrollment_count
FROM Enrollments
GROUP BY course_id
HAVING enrollment_count = (SELECT MAX(enrollment_count) FROM (SELECT COUNT(*) AS enrollment_count FROM Enrollments GROUP BY course_id) AS counts);


SELECT teacher_id, SUM(amount) AS total_payments
FROM Courses
JOIN Payments ON Courses.course_id = Payments.course_id
GROUP BY teacher_id;

SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) = (SELECT COUNT(*) FROM Courses);

SELECT teacher_name
FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

SELECT AVG(age) AS average_age
FROM (
    SELECT DATEDIFF(CURRENT_DATE, date_of_birth) / 365 AS age
    FROM Students
) AS student_ages;

SELECT course_id
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

SELECT student_id, course_id, SUM(amount) AS total_payments
FROM Payments
GROUP BY student_id, course_id;

SELECT student_id
FROM Payments
GROUP BY student_id
HAVING COUNT(*) > 1;


