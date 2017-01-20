\c markota

/*1. Write a query to delete a user named `michael` if it exists*/

DROP USER IF EXISTS "michael";

/*1. Write a query to create a user named `michael` with an encrypted password `stonebreaker`*/

CREATE USER "michael" WITH password 'stonebreaker';

/*1. Write a query to drop a database named `todo_app` if it exists*/

DROP DATABASE IF EXISTS "todo_app";

/*1. Write a query to create a database named `todo_app`*/

CREATE DATABASE "todo_app";

/*1. Connect to the newly created database*/

\c "todo_app";

/*1. Write a query to create a table named `tasks` using the **Initial columns** detailed below*/

CREATE TABLE "tasks" (

  id serial PRIMARY KEY NOT NULL,
  title varchar(255) NOT NULL,
  description text NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NULL,
  completed boolean NOT NULL DEFAULT false
);

/*1. Write queries to accomplish the following
  1. remove the column named `completed`*/

ALTER TABLE "tasks" DROP COLUMN "completed";

/*1. add a column to `tasks` named `completed_at`:timestamp, that may be NULL, and has a default value of `NULL`.*/

ALTER TABLE "tasks" ADD COLUMN "completed_at" timestamp without time zone DEFAULT null;

/*1. change the `updated_at` column to not allow NULL values, and have a default value of `now()*/

ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET NOT NULL;
ALTER TABLE "tasks" ALTER COLUMN "updated_at" SET DEFAULT now();

/*1. create a new task, by only setting values (not defining which columns)
  `id = default value`
  `title = 'Study SQL'`
  `description = 'Complete this exercise'`
  `created_at = now()`
  `updated_at = now()`
  `completed_at = NULL`*/

INSERT INTO "tasks"
VALUES (
  default,
  'study SQL',
  'complete this exercise',
  now(),
  now(),
  NULL
);

/*1. create a new task
  `title = 'Study PostgreSQL'`
  `description = 'Read all the documentation'`*/

INSERT INTO "tasks" (title, description)
VALUES (
  'study PostgreSQL',
  'Read all the documentation'
);

/*1. select all the titles of tasks that are not yet completed*/

/*SELECT "title"
FROM "tasks"
WHERE "completed_at" IS NULL;*/

/*1. update the task with a title of `'Study SQL'` to be completed as of now*/

UPDATE "tasks"
SET "completed_at" = now()
WHERE "title" = 'Study SQL';

/*1. select all titles and descriptions of tasks that are not yet completed*/

/*SELECT "title", "description"
FROM "tasks"
WHERE "completed_at" = NULL;*/

/*1. select all fields of every task sorted by creation date in descending order*/

SELECT *
FROM "tasks"
ORDER BY "created_at" DESC;

/*1. create a new task
  `title = 'mistake 1'`
  `description = 'a test entry'`*/

INSERT INTO "tasks" (title, description)
VALUES (
  'mistake 1',
  'a test entry'
);

/*1. create a new task
  `title = 'mistake 2'`
  `description = 'another test entry'`*/

INSERT INTO "tasks" (title, description)
VALUES (
  'mistake 2',
  'another test entry'
);

/*1. create a new task
  `title = 'third mistake'`
  `description = 'another test entry'`*/

INSERT INTO "tasks" (title, description)
VALUES (
  'mistake 3',
  'another test entry'
);

/*1. select title fields of all tasks with a title that includes the word `'mistake'`*/

SELECT *
FROM "tasks"
WHERE title LIKE '%mistake%';

/*1. delete the task that has a title of `mistake 1`*/

DELETE FROM "tasks"
WHERE title = 'mistake 1';

/*1. select title and description fields of all tasks with a title that includes the word `'mistake'`*/

SELECT *
FROM "tasks"
WHERE title LIKE '%mistake%';

/*1. delete all tasks that includes the word `'mistake'` in the title*/

DELETE
FROM "tasks"
WHERE title LIKE '%mistake%';

/*1. select all fields of all tasks sorted by `title` in ascending order*/

SELECT *
FROM "tasks"
ORDER BY "title" ASC;

\d+ "tasks";