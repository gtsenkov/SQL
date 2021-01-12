#01

SELECT e.`employee_id`, e.`job_title`, a.`address_id`
FROM employees AS e
JOIN addresses AS a
ON e.address_id = a.address_id
ORDER BY a.address_id
LIMIT 5;

#02

SELECT e.`first_name`, e.`last_name`, a.`address_text`
FROM employees AS e
JOIN addresses AS a
ON e.`address_id` = a.`address_id`
JOIN towns AS t
ON a.`town_id` = t.`town_id`
ORDER BY e.first_name, e.last_name
LIMIT 5;

#03

SELECT e.employee_id, e.first_name, e.last_name, d.`name`
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE d.`name` = 'Sales'
ORDER BY e.`employee_id` DESC;

#04

SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name`
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.`salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

#05

#EXAMPLE WITH SUBQUERY

SELECT e.employee_id, e.first_name
FROM employees AS e
WHERE e.employee_id 
NOT IN (SELECT employee_id FROM employees_projects)
ORDER BY e.`employee_id` DESC
LIMIT 3;

#EXAMPLE WITH JOIN

SELECT e.employee_id, e.first_name
FROM employees e #"AS e" ommited having same functionality
LEFT JOIN employees_projects AS ep
ON ep.employee_id = e.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;

#06

SELECT e.`first_name`, e.`last_name`, e.`hire_date`, 
d.`name` AS 'dept_name'
FROM employees AS e
JOIN departments AS d
ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01' 
AND d.name IN ('Sales', 'Finance')
ORDER BY e.`hire_date`;

#07

SELECT ep.`employee_id`, e.`first_name`,  p.`name`
FROM employees AS e
JOIN employees_projects AS ep
ON ep.employee_id = e.employee_id
JOIN projects AS P
ON ep.project_id = P.project_id
WHERE p.`start_date` > '2002-08-13'
AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name`
LIMIT 5;

#08

SELECT e.employee_id, e.first_name,
IF(YEAR(p.start_date) < 2005, p.`name`, NULL) AS 'project_name'
FROM employees AS e
JOIN employees_projects AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN projects AS p
ON ep.`project_id` = p.`project_id`
WHERE e.employee_id = 24
ORDER BY `project_name`;

#17

SELECT 
    c.country_name,
    MAX(p.elevation) AS 'highest_peak_elevation',
    MAX(r.length) AS 'longest_river_length'
FROM
    countries AS c
        JOIN
    countries_rivers AS cr ON c.country_code = cr.country_code
        JOIN
    rivers AS r ON cr.river_id = r.id
        JOIN
    mountains_countries AS mc ON mc.country_code = c.country_code
        JOIN
    mountains AS m ON mc.mountain_id = m.id
        JOIN
    peaks AS p ON p.mountain_id = m.id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC , longest_river_length DESC , c.country_name
LIMIT 5;

#16

SELECT COUNT(*)
FROM countries AS c
LEFT JOIN mountains_countries AS mc
ON c.country_code = mc.country_code
WHERE mc.mountain_id IS NULL;






