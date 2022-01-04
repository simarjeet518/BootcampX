SELECT count(assistance_requests.*) as total_assitances,teachers.name as name
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
WHERE name = 'Waylon Boehm'
GROUP BY name;