SELECT day,count(id) as total_assinments
FROM assignments
GROUP BY day
HAVING count(id) >= 10
ORDER BY day;