SELECT AVG(total_duration) as average FROM (SELECT sum(completed_at-started_at) as total_duration
FROM  assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name) as avarge_table;

