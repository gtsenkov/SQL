#01

SELECT * FROM `departments`;
-- comment for me - by default ordered acc primary key in asc

#02

SELECT `name` FROM `departments`
ORDER BY `department_id`;

#03

SELECT `first_name`, `last_name`, `salary` FROM `employees`;
-- comment for me - by default ordered acc primary key in asc

#04

SELECT 
    `first_name`, `middle_name`, `last_name`
FROM
    `employees`;
-- comment for me - code ordering by Ctr + B ili metlichkata

#05 

SELECT concat(`first_name`, '.', `last_name`,  '@softuni.bg')
AS 'full_email_address'
FROM `employees`;

#06

SELECT DISTINCT `salary` FROM `employees`;
-- distinct removes duplicated results

#07

SELECT * FROM `employees`
WHERE `job_title` = 'Sales Representative'
ORDER BY `employee_id`;

#08

SELECT `first_name`, `last_name`,  `job_title` 
FROM `employees`
WHERE `salary` BETWEEN 20000 AND 30000; -- BETWEEN [X AND X] - VKLUCHITELNO
-- WHERE `salary` >= 20000 AND `salary` <= 30000; - IS SAME

#09

SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`) AS 'Full Name'
FROM `employees`
WHERE `salary` IN (25000, 14000, 12500, 23600);

#10

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `manager_id` IS NULL;

#11

SELECT `first_name`, `last_name`, `salary`
FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

#12 

SELECT `first_name`, `last_name`
FROM `employees`
ORDER BY `salary` DESC
LIMIT 5;

#13

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `department_id` != 4;
# WHERE `department_id` NOT IN (4)
# WHERE `department_id` NOT IN (4, 5, 6)

#14

SELECT * FROM `employees`
ORDER BY `salary` DESC, `first_name` DESC, `middle_name`;

#15

CREATE VIEW v_employees_salaries AS
SELECT `first_name`, `last_name`, `salary`
FROM `employees`;

SELECT * FROM v_employees_salaries;

#16

CREATE VIEW v_employees_job_titles AS
SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`) AS 'full_name',
`job_title`
FROM `employees`;

SELECT * FROM v_employees_job_titles;

#17

SELECT DISTINCT `job_title` FROM `employees`;
-- distict gives unique values only

#18

SELECT * FROM `projects`
ORDER BY `start_date`, `name`
LIMIT 10;

#23

SELECT `country_name`, `country_code`, 
IF(`currency_code` = 'EUR', 'Euro', 'Not Euro') AS 'curency'
FROM countries
ORDER BY `country_name`;

