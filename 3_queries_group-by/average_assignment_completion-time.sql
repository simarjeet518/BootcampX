SELECT students.name as student, AVG(assignment_submissions.duration) as average_Assignment_duation
FROM students
JOIN assignment_submissions ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_Assignment_duation desc;