/*  Assignment6.sql 
    Jamal Bills
    CS 31A, Summer 2021 */

USE retailStore;

/* Query 1*/
SELECT 
    item_number,
    description,
    price 
FROM item
WHERE price IN (SELECT min(price) FROM item);



/* Query 2*/
SELECT
    customer_number,
    first_name,
    last_name
FROM customer
WHERE customer_number IN (SELECT cust_number FROM orders WHERE order_date = '2018-09-17');

/* Query 3*/
SELECT
    item_number,
    description,
    price,
    category
FROM item
WHERE price > ANY(SELECT price FROM item WHERE category = "Accessories");

/* Query 4*/
SELECT
    first_name,
    last_name,
    salary,
    manager_id
FROM employees
WHERE salary > ANY
    (SELECT salary
    FROM employees
    WHERE last_name = "Lorentz")
    AND department_id = 
        (SELECT department_id
        FROM employees
        WHERE last_name = "Abel");

/* Query 5*/
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) < (SELECT salary FROM employees WHERE last_name = "Ernst");

/* Query 6*/
SELECT
    department_id,
    MIN(salary) AS minimum_salary
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) FROM employees WHERE department_id <> 50);

/* Query 7*/

SELECT
    last_name,
    first_name,
    department_id,
    manager_id
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE employee_id = 141)
AND manager_id IN (SELECT manager_id FROM employees WHERE employee_id = 141)
AND NOT employee_id IN (SELECT employee_id FROM employees WHERE employee_id = 141);

/* Query 8*/
SELECT
    last_name,
    first_name,
    department_id,
    manager_id
FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE employee_id = 141)
AND manager_id = (SELECT manager_id FROM employees WHERE employee_id = 141);

/* Query 9*/
CREATE VIEW ITEM_ORDER AS
SELECT 
    i.item_number,
    i.description,
    i.price,
    o.order_id AS order_number,
    o.order_date,
    oi.quantity_ordered AS number_ordered,
    i.price*oi.quantity_ordered AS quoted_price
FROM item i
JOIN ordered_items oi ON i.item_number = oi.item_number
JOIN orders o ON o.order_id = oi.order_id;

/* Query 10*/
SELECT
    item_number,
    description,
    price,
    quoted_price
FROM ITEM_ORDER
WHERE quoted_price > 100; 

/* Query 11*/
CREATE VIEW dept_managers AS
SELECT
    d.department_name,
    LEFT(e.first_name ,1) AS FIRST_INITIAL,
    e.last_name AS SURNAME
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE e.job_id LIKE ('%MGR%')
OR e.job_id LIKE ('%MAN%');

SELECT * FROM dept_managers;


