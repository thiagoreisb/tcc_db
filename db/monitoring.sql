CREATE TABLE "contract" (
  "id" serial PRIMARY KEY,
  "start_date" date,
  "end_date" date,
  "situation" int,
  "assistance" bool,
  "subject_id" int
);

CREATE TABLE "advisor_history" (
  "id" serial PRIMARY KEY,
  "person_id" int,
  "contract_id" int,
  "start" date
);

CREATE TABLE "monitor_history" (
  "id" serial PRIMARY KEY,
  "person_id" int,
  "contract_id" int,
  "start" date
);

CREATE TABLE "schedule" (
  "id" serial PRIMARY KEY,
  "week_day" int,
  "start" time,
  "end" time,
  "observation" varchar,
  "situation" int,
  "activity" int,
  "classroom_id" int,
  "contract_id" int
);

CREATE TABLE "frequency" (
  "id" serial PRIMARY KEY,
  "expected_date" date,
  "actual_date" date,
  "start" time,
  "end" time,
  "observation" varchar,
  "status" int,
  "classroom_id" int,
  "schedule_id" int
);

CREATE TABLE "attendance" (
  "id" serial PRIMARY KEY,
  "start" time,
  "end" time,
  "observation" varchar,
  "frequency_id" int,
  "person_id" int
);

ALTER TABLE "advisor_history" ADD FOREIGN KEY ("contract_id") REFERENCES "contract" ("id");

ALTER TABLE "monitor_history" ADD FOREIGN KEY ("contract_id") REFERENCES "contract" ("id");

ALTER TABLE "schedule" ADD FOREIGN KEY ("contract_id") REFERENCES "contract" ("id");

ALTER TABLE "frequency" ADD FOREIGN KEY ("schedule_id") REFERENCES "schedule" ("id");

ALTER TABLE "attendance" ADD FOREIGN KEY ("frequency_id") REFERENCES "frequency" ("id");
