BEGIN TRANSACTION;

UPDATE Courses
SET available_seats=available_seats-1
WHERE course_id=101
AND available_seats>0;

INSERT INTO Enrollments
(student_id,course_id,semester)

VALUES
(2,101,'Spring2025');

COMMIT;
