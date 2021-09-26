
USE retailStore;

/* Query 1 */
SELECT order_id, order_date ,customer_number, first_name, last_name
FROM orders o, customer c
WHERE (o.cust_number = c.customer_number);

/* Query 2 */
SELECT order_id , customer_number , first_name , last_name 
FROM  orders, customer 
WHERE order_date = "2018-9-17"


/* Query 3 */
SELECT o.order_id, order_date, i.item_number, quantity_ordered, price
FROM orders o, ordered_items, item i;

/* Query 4 */
SELECT customer_number, first_name, last_name
FROM orders o, customer c
WHERE (o.cust_number = c.customer_number)
AND (o.order_date <> '2018-9-17');

/* Query 5 */
SELECT o.order_id, o.order_date ,i.item_number, description, category
FROM orders o, customer c, item i
JOIN ordered_items y
WHERE (i.item_number = y.item_number)
AND (o.cust_number = c.customer_number);
ORDER BY category, order_id

/* Query 6 */
SELECT o.order_id, order_date
FROM orders o, ordered_items y, item i
WHERE (o.order_id = y.order_id)
AND (i.description <> "team shirt with emblem");

/* Query 7 */
SELECT o.order_id, order_date
FROM orders o, ordered_items y, item i, customer c
WHERE (c.first_name = "Robert")
AND (o.order_id = y.order_id )
AND (i.description <> "team shirt with emblem");

/* Query 8 */
SELECT  customer_number, first_name, last_name, address_line_1, address_line_2, city
FROM customer c
CORSS JOIN cust_address;

/* Query 9 */
SELECT customer_number, first_name,last_name,phone_number, email, name
FROM customer INNER JOIN membership m
ON (customer.member_id = m.id);

/* Query 10 */
SELECT *
FROM customer
CROSS JOIN membership;

