SELECT students.name as student, AVG(assignment_submissions.duration) as average_Assignment_duation, AVG(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING AVG(assignments.duration) >AVG(assignment_submissions.duration)
ORDER BY average_Assignment_duation ;