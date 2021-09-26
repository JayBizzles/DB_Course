/*  Assignment5.sql 
    Jamal Bills
    CS 31A, Summer 2021 */

USE retailStore;

/* Query 1 */
SELECT AVG(salary) AS Average
FROM employees
WHERE manager_id = 100;

/* Query 2 */

SELECT 
    MIN(salary),
    MAX(hire_date),
    MIN(last_name) AS first_last_name,
    MAX(last_name) AS last_last_name
FROM employees
WHERE department_id BETWEEN 50 AND 60;

/* Query 3 */

SELECT
    MAX(hire_date)
FROM employees;

/* Query 4 */
SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    salary AS Salary
FROM employees
where last_name LIKE '%ar%';

/* Query 5 */

SELECT
    MIN(last_name) AS first_last_name,
    MAX(last_name) AS last_last_name
FROM employees;

/* Query 6 */

SELECT
    employee_id,
    CONCAT("$",TRUNCATE(salary/4,2)) AS weekly_salary
FROM employees
WHERE salary/4 BETWEEN 700 AND 3000;

/* Query 7 */

SELECT
    item_number,
    UPPER(description) AS item_description
FROM item;

/* Query 8 */

SELECT
    customer_number,
    first_name,
    last_name,
    ROUND(current_balance,0) AS balance
FROM customer;

/* Query 9 */

SELECT
    o.order_id,
    o.cust_number,
    first_name,
    last_name,
    order_date,
    DATE_ADD(order_date, INTERVAL 20 DAY) AS promotion_date /* for some reason MySQL and SQL have different functions */
FROM orders o
JOIN customer c
ON (o.cust_number = c.customer_number);

/* Query 10 */

SELECT
    COUNT(*) AS num_orders,
    SUM(number_of_units) AS number_of_units
FROM orders;

/* Query 11 */

SELECT
    item_number,
    COUNT(*) AS numorders
FROM ordered_items
GROUP BY item_number
ORDER BY numorders DESC;

/* Query 12 */

SELECT
    email,
    COUNT(DISTINCT item_number) AS number_of_items
FROM customer c
JOIN orders o
JOIN ordered_items oi
WHERE o.cust_number = c.customer_number AND oi.order_id = o.order_id /*why does ON not work here?*/
GROUP BY cust_number
HAVING COUNT(DISTINCT item_number) >1;

/* Query 13 */
SELECT 
    category,
    COUNT(item_number),
    AVG(price) AS Average_price_of_the_products
FROM item
GROUP BY category
HAVING COUNT(DISTINCT item_number) > 1;