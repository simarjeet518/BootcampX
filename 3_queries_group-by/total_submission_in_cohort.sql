SELECT cohorts.name as cohort ,count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students
on student_id = students.id
JOIN cohorts
on cohorts.id = students.cohort_id
GROUP BY cohort
ORDER BY total_submissions desc;