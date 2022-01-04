SELECT count(assistance_requests.*) as total_assitances,students.name as name
FROM assistance_requests
JOIN students ON student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY name;