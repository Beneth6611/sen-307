USE sen307_11406;

-- Part 1: Departments
INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

-- Part 1: Courses (each course finds its department by name)
INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- Check: should list 5 departments with 10 courses between them
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;


-- Part 2, Step 1: Lecturers (10 in total, spread across all 5 departments)
INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/103', 'Mrs Funke Eze', 'f.eze@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/104', 'Dr Ibrahim Danjuma', 'i.danjuma@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/105', 'Dr Ngozi Nwosu', 'n.nwosu@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/106', 'Dr Tunde Adeyemi', 't.adeyemi@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/107', 'Dr Halima Yusuf', 'h.yusuf@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/108', 'Mr Emeka Obiora', 'e.obiora@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/109', 'Dr Samuel Adebayo', 's.adebayo@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUA/ST/110', 'Dr Blessing Akpan', 'b.akpan@vua.edu.ng', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- Part 2, Step 2: Students (20 in total, including me)
-- My own row has no gender or date of birth yet (NULL); fill them in later with an UPDATE if you want.
INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('VUG/SEN/24/11406', 'Edwin Beneth Jnr Ugochukwu', NULL, NULL, (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/11401', 'Chinedu Okonkwo', 'M', '2004-02-18', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/11402', 'Aisha Mohammed', 'F', '2005-07-09', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/11403', 'Tolu Adeniyi', 'F', '2003-11-23', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/11404', 'Emmanuel Okon', 'M', '2006-05-30', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/11405', 'Grace Ibekwe', 'F', '2004-09-12', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/11407', 'Ibrahim Sani', 'M', '2005-01-27', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/COS/24/12001', 'Ada Nwankwo', 'F', '2005-03-14', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/COS/24/12002', 'John Danladi', 'M', '2004-11-02', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/COS/24/12003', 'Zainab Bello', 'F', '2006-08-19', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/COS/24/12004', 'Kelechi Eze', 'M', '2003-06-05', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/AIN/24/13001', 'Fatima Abubakar', 'F', '2004-04-21', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/AIN/24/13002', 'Oluwaseun Balogun', 'M', '2005-12-08', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/AIN/24/13003', 'Ngozi Umeh', 'F', '2007-01-16', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/DTS/24/14001', 'Tunde Afolabi', 'M', '2003-09-29', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/DTS/24/14002', 'Hauwa Garba', 'F', '2006-03-03', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/DTS/24/14003', 'Daniel Eyo', 'M', '2004-07-25', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/CYB/24/15001', 'Blessing Ogundele', 'F', '2005-10-11', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/CYB/24/15002', 'Samuel Okeke', 'M', '2003-12-31', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/CYB/24/15003', 'Maryam Lawal', 'F', '2007-05-06', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- Part 2, Step 3: Enrolments (40 in total)
-- Students 15002 and 15003 are deliberately NOT enrolled in anything.
-- SEN307 has 8 students (more than 5).
-- IDs are looked up by matric number and course code, so the auto-increment numbers do not matter.
INSERT INTO Enrolment (student_id, course_id)
SELECT s.student_id, c.course_id
FROM (
  SELECT 'VUG/SEN/24/11406' AS matric_no, 'SEN307' AS course_code
  UNION ALL SELECT 'VUG/SEN/24/11406', 'SEN301'
  UNION ALL SELECT 'VUG/SEN/24/11406', 'COS301'
  UNION ALL SELECT 'VUG/SEN/24/11401', 'SEN307'
  UNION ALL SELECT 'VUG/SEN/24/11401', 'SEN301'
  UNION ALL SELECT 'VUG/SEN/24/11402', 'SEN307'
  UNION ALL SELECT 'VUG/SEN/24/11402', 'AIN301'
  UNION ALL SELECT 'VUG/SEN/24/11403', 'SEN307'
  UNION ALL SELECT 'VUG/SEN/24/11403', 'SEN301'
  UNION ALL SELECT 'VUG/SEN/24/11403', 'DTS301'
  UNION ALL SELECT 'VUG/SEN/24/11404', 'SEN307'
  UNION ALL SELECT 'VUG/SEN/24/11404', 'COS305'
  UNION ALL SELECT 'VUG/SEN/24/11405', 'SEN307'
  UNION ALL SELECT 'VUG/SEN/24/11405', 'SEN301'
  UNION ALL SELECT 'VUG/SEN/24/11407', 'SEN307'
  UNION ALL SELECT 'VUG/SEN/24/11407', 'AIN305'
  UNION ALL SELECT 'VUG/COS/24/12001', 'COS301'
  UNION ALL SELECT 'VUG/COS/24/12001', 'COS305'
  UNION ALL SELECT 'VUG/COS/24/12001', 'SEN307'
  UNION ALL SELECT 'VUG/COS/24/12002', 'COS301'
  UNION ALL SELECT 'VUG/COS/24/12002', 'COS305'
  UNION ALL SELECT 'VUG/COS/24/12003', 'COS301'
  UNION ALL SELECT 'VUG/COS/24/12003', 'AIN301'
  UNION ALL SELECT 'VUG/COS/24/12004', 'COS305'
  UNION ALL SELECT 'VUG/COS/24/12004', 'CYB301'
  UNION ALL SELECT 'VUG/AIN/24/13001', 'AIN301'
  UNION ALL SELECT 'VUG/AIN/24/13001', 'AIN305'
  UNION ALL SELECT 'VUG/AIN/24/13001', 'AIN307'
  UNION ALL SELECT 'VUG/AIN/24/13002', 'AIN305'
  UNION ALL SELECT 'VUG/AIN/24/13002', 'AIN307'
  UNION ALL SELECT 'VUG/AIN/24/13003', 'AIN301'
  UNION ALL SELECT 'VUG/AIN/24/13003', 'AIN307'
  UNION ALL SELECT 'VUG/AIN/24/13003', 'DTS301'
  UNION ALL SELECT 'VUG/DTS/24/14001', 'DTS301'
  UNION ALL SELECT 'VUG/DTS/24/14001', 'DTS305'
  UNION ALL SELECT 'VUG/DTS/24/14001', 'AIN305'
  UNION ALL SELECT 'VUG/DTS/24/14002', 'DTS301'
  UNION ALL SELECT 'VUG/DTS/24/14002', 'DTS305'
  UNION ALL SELECT 'VUG/DTS/24/14003', 'DTS305'
  UNION ALL SELECT 'VUG/CYB/24/15001', 'CYB301'
) p
JOIN Student s ON s.matric_no = p.matric_no
JOIN Course c ON c.course_code = p.course_code;

-- Part 2, Step 3: Course allocations
-- Every course has at least one lecturer; SEN307 has two (Dr Okafor and Dr Bello).
INSERT INTO CourseAllocation (course_id, lecturer_id)
SELECT c.course_id, l.lecturer_id
FROM (
  SELECT 'SEN307' AS course_code, 'VUA/ST/101' AS staff_no
  UNION ALL SELECT 'SEN307', 'VUA/ST/102'
  UNION ALL SELECT 'SEN301', 'VUA/ST/102'
  UNION ALL SELECT 'COS301', 'VUA/ST/103'
  UNION ALL SELECT 'COS305', 'VUA/ST/104'
  UNION ALL SELECT 'AIN301', 'VUA/ST/105'
  UNION ALL SELECT 'AIN305', 'VUA/ST/106'
  UNION ALL SELECT 'AIN307', 'VUA/ST/105'
  UNION ALL SELECT 'DTS301', 'VUA/ST/107'
  UNION ALL SELECT 'DTS305', 'VUA/ST/108'
  UNION ALL SELECT 'CYB301', 'VUA/ST/109'
) p
JOIN Course c ON c.course_code = p.course_code
JOIN Lecturer l ON l.staff_no = p.staff_no;

-- Quick check: should show 10 lecturers, 20 students, 40 enrolments, 11 allocations
SELECT 'Lecturers' AS tbl, COUNT(*) AS total FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;

-- Part 3: UPDATE a record (move one student to another department)
SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/SEN/24/11407';

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')
WHERE matric_no = 'VUG/SEN/24/11407';

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = 'VUG/SEN/24/11407';

-- Part 4, Step 1: create a department with a student in it
INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
        (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));

-- Part 4, Step 2: try to delete the department
-- This FAILED with Error Code 1451 (a student still points to the department)
DELETE FROM Department WHERE dept_name = 'Library and Information Science';

-- Part 4, Step 3: fix it the correct way
-- 1) reassign the dependent student to another department
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

-- 2) now the delete succeeds
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SELECT * FROM Department;

-- Final check
SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;
