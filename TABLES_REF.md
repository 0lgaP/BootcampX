CREATE TABLE `assignments` (<br>
  `id` SERIAL PRIMARY KEY NOT NULL,<br>
  `name` VARCHAR(255),<br>
  `content` TEXT,<br>
  `day` INTEGER,<br>
  `chapter` INTEGER,<br>
  `duration` INTEGER<br>
);<br>

CREATE TABLE `assignment_submissions` (<br>
  `id` SERIAL PRIMARY KEY NOT NULL,<br>
  `assignment_id` INTEGER REFERENCES assignments(id) on DELETE CASCADE,<br>
  `student_id` INTEGER REFERENCES students(id) on DELETE CASCADE,<br>
  `duration` INTEGER,<br>
  `submission_date` DATE<br>
);

CREATE TABLE `cohorts` (<br>
  `id` SERIAL PRIMARY KEY NOT NULL,<br>
  `name` VARCHAR(255) NOT NULL,<br>
  `start_date` DATE,<br>
  `end_date` DATE<br>
);

CREATE TABLE `students` (<br>
  `id` SERIAL PRIMARY KEY NOT NULL,<br>
  `name `VARCHAR(255) NOT NULL,<br>
  `email` VARCHAR(255),<br>
  `phone` VARCHAR(32),<br>
  `github` VARCHAR(255),<br>
  `start_date` DATE,<br>
  `end_date` DATE,<br>
  `cohort_id `INTEGER REFERENCES cohorts(id) on DELETE CASCADE<br>
);

CREATE TABLE `teachers` (<br>
  `id` SERIAL PRIMARY KEY NOT NULL,<br>
  `name` VARCHAR(255) NOT NULL,<br>
  `is_active` BOOLEAN DEFAULT TRUE,<br>
  `start_date` DATE,<br>
  `end_date` DATE<br>
);

CREATE TABLE `assistance_requests` (<br>
  `id` SERIAL PRIMARY KEY NOT NULL,<br>
  `student_id` INTEGER REFERENCES students(id) on DELETE CASCADE,<br>
  `teacher_id` INTEGER REFERENCES teachers(id) on DELETE CASCADE,<br>
  `assignment_id` INTEGER REFERENCES assignments(id) on DELETE CASCADE,<br>
  `created_at` TIMESTAMP,<br>
  `started_at` TIMESTAMP,<br>
  `completed_at` TIMESTAMP,<br>
  `student_feedback` TEXT,<br>
  `teacher_feedback` TEXT<br>
);



