## Tasks
-- 1. Get all customers and their addresses.
SELECT CONCAT(customers.first_name,' ',customers.last_name) "Full Name", a.street, a.city, a.state, a.zip
FROM customers
JOIN addresses a ON a.customer_id = customers.id;


-- 2. Get all orders and their line items (orders, quantity and product).

SELECT orders.id, products.description, l.quantity   
FROM orders
JOIN line_items l ON orders.id = l.order_id
JOIN products ON l.product_id = products.id;

-- 3. Which warehouses have cheetos?

SELECT warehouse.warehouse, products.description
FROM products
JOIN warehouse_product wp ON wp.product_id = products.id
JOIN warehouse on wp.warehouse_id = warehouse.id
WHERE products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?

SELECT warehouse.warehouse, products.description
FROM products
JOIN warehouse_product wp ON wp.product_id = products.id
JOIN warehouse on wp.warehouse_id = warehouse.id
WHERE products.description = 'diet pepsi';

5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT customers.first_name, count(orders.id)
FROM orders
JOIN addresses ON orders.address_id = addresses.id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.first_name;

6. How many customers do we have?

SELECT count(*)
FROM customers;



7. How many products do we carry?
SELECT count(*)
FROM products;


8. What is the total available on-hand quantity of diet pepsi?

SELECT products.description, SUM(warehouse_product.on_hand )
FROM warehouse_product
JOIN products ON products.id = warehouse_product.product_id
GROUP BY products.description;

## Stretch
9. How much was the total cost for each order?

SELECT SUM(products.unit_price*line_items.quantity), orders.id
FROM products
JOIN line_items ON products.id = line_items.product_id
JOIN orders ON line_items.order_id = orders.id
GROUP BY orders.id;

10. How much has each customer spent in total?

SELECT SUM(products.unit_price) total_spent, customers.first_name
FROM products
JOIN line_items ON line_items.product_id = products.id
JOIN orders ON line_items.order_id = orders.id
JOIN addresses ON orders.address_id = addresses.id
JOIN customers ON customers.id = addresses.customer_id
GROUP BY customers.first_name;

11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).


## products
- id
- descriptions
- unit price
## line_items
- id
- quantity
- order_id
- product_id
## orders
- id
- order_date
- address_id
## addresses
-id
-customer_id
## customers
-id
-first_name
-last_name
## warehouse
- id
- warehouse
- fulfillment_days
## warehouse_products
- product_id
- warehouse_id
- on_hand



