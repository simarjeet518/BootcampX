const { Pool } = require('pg');
const Config ={
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
}

const pool = new Pool(Config);

const cohort = process.argv[2];
const limit = process.argv[3];

pool.query(`
SELECT students.id, students.name , cohorts.name as cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
where cohorts.name LIKE '%${cohort}%'
LIMIT ${limit || 5};
`)
.then(res => {
  res.rows.forEach(student => {
    console.log(`${student.name} has student id ${student.id} was  in cohort  ${student.cohort}`);
  });
  pool.end();
})
.catch(err => console.log('query error', err.stack));