-- Query using IN
SELECT * FROM Students
WHERE department IN ('CSE','IT');


-- Query using BETWEEN
SELECT * FROM Enrollments
WHERE marks BETWEEN 80 AND 90;



-- Students whose marks are not yet entered
SELECT *
FROM Enrollments
WHERE marks IS NULL;



-- Courses having more than one student
SELECT course_id,
COUNT(*) AS TotalStudents
FROM Enrollments
GROUP BY course_id
HAVING COUNT(*)>1;



-- Student and enrolled courses
SELECT s.first_name,
c.course_name
FROM Students s
INNER JOIN Enrollments e
ON s.student_id=e.student_id
INNER JOIN Courses c
ON e.course_id=c.course_id;




-- All students including those not enrolled
SELECT s.first_name,
c.course_name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id=e.student_id
LEFT JOIN Courses c
ON c.course_id=e.course_id;


RIGHT JOIN substitute

SQLite doesn't support RIGHT JOIN.

Use LEFT JOIN by reversing tables.

-- RIGHT JOIN substituted using LEFT JOIN
SELECT c.course_name,
s.first_name
FROM Courses c
LEFT JOIN Enrollments e
ON c.course_id=e.course_id
LEFT JOIN Students s
ON s.student_id=e.student_id;




  -- Students scoring above average
SELECT first_name
FROM Students
WHERE student_id IN
(
SELECT student_id
FROM Enrollments
WHERE marks >
(
SELECT AVG(marks)
FROM Enrollments
)
);



  -- Highest scorer in every course
SELECT *
FROM Enrollments e
WHERE marks=
(
SELECT MAX(marks)
FROM Enrollments
WHERE course_id=e.course_id
);




  -- Students having enrollments
SELECT *
FROM Students s
WHERE EXISTS
(
SELECT 1
FROM Enrollments e
WHERE s.student_id=e.student_id
);




  -- All instructor and student emails
SELECT email
FROM Students

UNION

SELECT email
FROM Instructors;



  -- Rank students by marks
SELECT
student_id,
marks,
RANK() OVER
(ORDER BY marks DESC) RankNo
FROM Enrollments;





