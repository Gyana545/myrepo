USE `EXP1`;

ALTER TABLE employee DROP COLUMN IF EXISTS salary;
ALTER TABLE employee DROP COLUMN IF EXISTS age;

ALTER TABLE employee ADD COLUMN salary INT, ADD COLUMN age INT;

UPDATE employee SET salary = 1000, age = 25 WHERE id = 1;
