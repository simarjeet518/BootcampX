const { Pool } = require('pg');
const Config ={
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
}

const pool = new Pool(Config);

const cohort = process.argv[2];


pool.query(`
SELECT distinct teachers.name as teacher, cohorts.name as cohort ,COUNT(assistance_requests.*) as total_assistances
FROM assistance_requests 
JOIN teachers ON teacher_id = teachers.id 
JOIN  students ON student_id = students.id 
JOIN cohorts ON students.cohort_id = cohorts.id 
WHERE cohorts.name LIKE '%${cohort}%'
GROUP BY teachers.name , cohorts.name
ORDER BY teacher;
`)
.then(res => {
  res.rows.forEach(data => {
    console.log(`${data.cohort} : ${data.teacher} `);
  });
  pool.end();
})
.catch(err => console.log('query error', err.stack));