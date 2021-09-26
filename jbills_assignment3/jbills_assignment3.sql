/*  Assignment3.sql 
    Jamal Bills
    CS 31A, Summer 2021 */

USE retailStore;
/* Query 1 */

SELECT id AS inventory_id, cost, units AS num_of_units_in_stock FROM inv_list WHERE cost >=3.00 AND cost <=15.00;

/* Query 2 */

SELECT id AS inventory_id, cost, units AS num_of_units_in_stock FROM inv_list WHERE units % 50 = 0;

/* Query 3 */

SELECT item_number AS item_id, name AS item_name FROM item WHERE name LIKE "%o%";

/* Query 4 */

SELECT cust_number AS customer_number, address_line_1 AS street_address, zip_code AS postal_code FROM cust_address WHERE city = 'Ralston' AND address_line_2 = "WY";

/* Query 5 */

SELECT customer_number, first_name, last_name FROM customer WHERE last_name LIKE "%s";

/* Query 6 */

SELECT item_number, description FROM item WHERE category = "Footwear" AND description LIKE "%team%" OR category = "clothing" AND description LIKE "%team%";

/* Query 7 */

SELECT first_name, last_name, salary FROM employees WHERE salary <> 3400 AND 3000 AND 6000 AND first_name LIKE "S%";

/* Query 8 */

SELECT item_number, name, description FROM item WHERE name LIKE "_l%" AND name LIKE "___v%" ORDER BY item_number DESC;

/* Query 9 */

DELETE FROM cust_address WHERE address_line_1 = '83 Barrhill Drive';

/* Query 10 */

DESCRIBE customer;

ALTER TABLE customer ADD COLUMN mobile_phone VARCHAR(11);

DESCRIBE customer;

/* Query 11 */

DESCRIBE customer;

ALTER TABLE customer DROP COLUMN mobile_phone;

DESCRIBE customer;

/* Query 12 */

CREATE TABLE o_jobs AS (SELECT * FROM jobs);
CREATE TABLE o_employees AS (SELECT * FROM employees);
CREATE TABLE o_departments AS (SELECT * FROM departments);

/* Query 13 */

INSERT INTO o_jobs (job_id, job_title, min_salary, max_salary)
VALUES('hr_man','human resources manager',4500,5500);

/* Query 14 */

ALTER TABLE o_jobs RENAME TO o_job_description;