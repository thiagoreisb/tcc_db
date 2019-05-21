CREATE TABLE "report" (
  "id" serial PRIMARY KEY,
  "suggestions" varchar,
  "activities" varchar,
  "observation" varchar,
  "evaluation" int,
  "renew" bool,
  "responsability" int,
  "planning" int,
  "criativity" int,
  "relationship" int,
  "autodevelopment" int,
  "autocritics" int,
  "sent" date,
  "person_id" int,
  "contract_id" int
);

CREATE TABLE "coordinator" (
  "id" serial PRIMARY KEY,
  "suggestions" varchar,
  "activities" varchar,
  "observation" varchar,
  "sent" date,
  "person_id" int
);

CREATE TABLE "coordinator_report" (
  "advisor_id" int,
  "monitor_id" int,
  "coordinator_id" int,
  "renew" bool
);

ALTER TABLE "coordinator_report" ADD CONSTRAINT "coordinator_report_pk" PRIMARY KEY ("advisor_id", "monitor_id", "coordinator_id");

ALTER TABLE "coordinator_report" ADD FOREIGN KEY ("advisor_id") REFERENCES "report" ("id");

ALTER TABLE "coordinator_report" ADD FOREIGN KEY ("monitor_id") REFERENCES "report" ("id");

ALTER TABLE "coordinator_report" ADD FOREIGN KEY ("coordinator_id") REFERENCES "coordinator" ("id");

