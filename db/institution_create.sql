CREATE TABLE "person" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar,
  "type" int
);

CREATE TABLE "department" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "person_id" int
);

CREATE TABLE "course" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "person_id" int,
  "department_id" int
);

CREATE TABLE "subject" (
  "id" serial PRIMARY KEY,
  "name" varchar NOT NULL,
  "department_id" int
);

CREATE TABLE "course_subject" (
  "id_course" int,
  "id_subject" int,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "course_person" (
  "id_course" int,
  "id_person" int,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "classroom" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "department" ADD FOREIGN KEY ("person_id") REFERENCES "person" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("person_id") REFERENCES "person" ("id");

ALTER TABLE "course" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("id");

ALTER TABLE "subject" ADD FOREIGN KEY ("department_id") REFERENCES "department" ("id");

ALTER TABLE "course_subject" ADD FOREIGN KEY ("id_course") REFERENCES "course" ("id");

ALTER TABLE "course_subject" ADD FOREIGN KEY ("id_subject") REFERENCES "subject" ("id");

ALTER TABLE "course_person" ADD FOREIGN KEY ("id_course") REFERENCES "course" ("id");

ALTER TABLE "course_person" ADD FOREIGN KEY ("id_person") REFERENCES "person" ("id");

ALTER TABLE "course_subject" ADD CONSTRAINT "course_subject_pk" PRIMARY KEY ("id_course", "id_subject");

ALTER TABLE "course_person" ADD CONSTRAINT "course_person_pk" PRIMARY KEY ("id_course", "id_person");
