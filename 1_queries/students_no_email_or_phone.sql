SELECT name, id, cohort_id
FROM students
WHERE email IS Null 
OR phone IS Null;