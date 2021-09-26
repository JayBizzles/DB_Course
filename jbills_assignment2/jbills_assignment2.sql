/*  Assignment2.sql 
    Jamal Bills
    CS 31A, Summer 2021 */
 

USE company;

/* Query 1 */

SELECT item_number, description, color FROM item;

/* Query 2 */

SELECT * FROM orders;

/* Query 3 */

SELECT first_name, last_name FROM customer WHERE current_balance>100;

/* Query 4 */

SELECT * FROM orders WHERE cust_number = 'c00103' AND order_date = '2017-05-27';

/* Query 5 */

SELECT customer_number, first_name, last_name, email, phone_number FROM customer;

/* Query 6 */

SELECT customer_number, first_name, last_name, current_balance, current_balance - 5 AS balance_minus_gift  FROM customer;

/* Query 7 */

SELECT first_name,last_name, current_balance, current_balance /12 AS monthly_payments FROM customer;

/* Query 8 */

SELECT order_id, order_date FROM orders WHERE order_date <= '2017-05-27';

/* Query 9 */

SELECT * FROM item ORDER BY category, item_number;

/* Query 10 */

SELECT last_name,first_name, customer_number FROM customer WHERE customer_number = 'c00103';

/* Query 11 */

SELECT DISTINCT cust_number FROM orders;