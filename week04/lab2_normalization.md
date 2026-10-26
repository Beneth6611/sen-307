# VUA-SEN307 Lab 2: Database Design and Normalization

## Unnormalized table

| matric_no | student_name | student_dept | course_codes | course_titles | lecturers | lecturer_depts | session |
|---|---|---|---|---|---|---|---|
| 20231234 | Ada Obi | Software Engineering | SEN307, SEN301 | Database Systems, Software Architecture | Dr A. Okafor, Dr M. Bello | Software Eng., Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307, COS301 | Database Systems, Operating Systems | Dr A. Okafor, Mrs F. Eze | Software Eng., Computer Sci. | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

Problem: several cells hold more than one value, and the same facts are repeated across rows.

## First Normal Form (1NF)

Primary key: **(matric_no, course_code)**

| matric_no | course_code | student_name | student_dept | course_title | lecturer | lecturer_dept | session |
|---|---|---|---|---|---|---|---|
| 20231234 | SEN307 | Ada Obi | Software Engineering | Database Systems | Dr A. Okafor | Software Eng. | 2026/2027 |
| 20231234 | SEN301 | Ada Obi | Software Engineering | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |
| 20231235 | SEN307 | John Musa | Computer Science | Database Systems | Dr A. Okafor | Software Eng. | 2026/2027 |
| 20231235 | COS301 | John Musa | Computer Science | Operating Systems | Mrs F. Eze | Computer Sci. | 2026/2027 |
| 20231236 | SEN301 | Grace Okon | Software Engineering | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

**What I fixed:** I split the multi-valued cells so every cell holds a single value and each student-course pair has its own row, identified by a composite primary key.

## Second Normal Form (2NF)

Partial dependencies found: `student_name` and `student_dept` depend only on `matric_no`; `course_title` depends only on `course_code`; the lecturer depends on the course and session, not on the student.

**Student**

| matric_no (PK) | student_name | student_dept |
|---|---|---|
| 20231234 | Ada Obi | Software Engineering |
| 20231235 | John Musa | Computer Science |
| 20231236 | Grace Okon | Software Engineering |

**Course**

| course_code (PK) | course_title |
|---|---|
| SEN307 | Database Systems |
| SEN301 | Software Architecture |
| COS301 | Operating Systems |

**Enrolment** (PK: matric_no, course_code, session)

| matric_no | course_code | session |
|---|---|---|
| 20231234 | SEN307 | 2026/2027 |
| 20231234 | SEN301 | 2026/2027 |
| 20231235 | SEN307 | 2026/2027 |
| 20231235 | COS301 | 2026/2027 |
| 20231236 | SEN301 | 2026/2027 |

**CourseLecturer** (PK: course_code, session, lecturer)

| course_code | session | lecturer | lecturer_dept |
|---|---|---|---|
| SEN307 | 2026/2027 | Dr A. Okafor | Software Eng. |
| SEN301 | 2026/2027 | Dr M. Bello | Software Eng. |
| COS301 | 2026/2027 | Mrs F. Eze | Computer Sci. |

**What I fixed:** I moved every attribute that depended on only part of the composite key into its own table, so a student's name or a course title is stored once instead of once per registration.

## Third Normal Form (3NF)

Transitive dependencies found: `student_dept` and `lecturer_dept` describe a department, not the student or lecturer. The same department is even written two ways ("Software Eng." and "Software Engineering"), and renaming a department would mean updating many rows.

**Department**

| dept_id (PK) | dept_name |
|---|---|
| 1 | Software Engineering |
| 2 | Computer Science |

**Student**

| student_id (PK) | matric_no | full_name | dept_id (FK) |
|---|---|---|---|
| 1 | 20231234 | Ada Obi | 1 |
| 2 | 20231235 | John Musa | 2 |
| 3 | 20231236 | Grace Okon | 1 |

**Lecturer**

| lecturer_id (PK) | full_name | dept_id (FK) |
|---|---|---|
| 1 | Dr A. Okafor | 1 |
| 2 | Dr M. Bello | 1 |
| 3 | Mrs F. Eze | 2 |

**Course**

| course_id (PK) | course_code | course_title |
|---|---|---|
| 1 | SEN307 | Database Systems |
| 2 | SEN301 | Software Architecture |
| 3 | COS301 | Operating Systems |

**Enrolment**

| enrolment_id (PK) | student_id (FK) | course_id (FK) | session |
|---|---|---|---|
| 1 | 1 | 1 | 2026/2027 |
| 2 | 1 | 2 | 2026/2027 |
| 3 | 2 | 1 | 2026/2027 |
| 4 | 2 | 3 | 2026/2027 |
| 5 | 3 | 2 | 2026/2027 |

**Teaching**

| teaching_id (PK) | course_id (FK) | lecturer_id (FK) | session |
|---|---|---|---|
| 1 | 1 | 1 | 2026/2027 |
| 2 | 2 | 2 | 2026/2027 |
| 3 | 3 | 3 | 2026/2027 |

**What I fixed:** I moved department details into a Department table and linked to it with foreign keys, so a department's name is stored once and cannot become inconsistent. The Teaching table records which lecturer teaches which course in which session.

## Final schema

```
Department (dept_id PK, dept_name)
Student (student_id PK, matric_no, full_name, dept_id FK -> Department)
Lecturer (lecturer_id PK, full_name, dept_id FK -> Department)
Course (course_id PK, course_code, course_title)
Enrolment (enrolment_id PK, student_id FK -> Student, course_id FK -> Course, session)
Teaching (teaching_id PK, course_id FK -> Course, lecturer_id FK -> Lecturer, session)
```

Relationships: Department 1:N Student, Department 1:N Lecturer, Student M:N Course (via Enrolment), Course M:N Lecturer (via Teaching).
