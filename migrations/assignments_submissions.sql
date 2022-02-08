CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) on DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) on DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);

-- CREATE TABLE cohorts (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   start_date DATE,
--   end_date DATE
-- );

-- CREATE TABLE students (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255),
--   phone VARCHAR(32),
--   github VARCHAR(255),
--   start_date DATE,
--   end_date DATE,
--   cohort_id INTEGER REFERENCES cohorts(id) on DELETE CASCADE

-- );

SELECT students.name as student, AVG(assignment_submissions.duration) as average_assignment_duration, AVG(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration;


