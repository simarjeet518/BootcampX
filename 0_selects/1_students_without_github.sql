SELECT id, name, email, cohort_id
FROM students
WHERE github IS Null
ORDER BY cohort_id;