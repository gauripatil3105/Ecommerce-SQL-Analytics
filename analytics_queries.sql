USE ecommerce_db;


USE ecommerce_db;

-- Query 1: Display all customers
SELECT *
FROM Customers;

-- Query 2: Display customer names and email
SELECT first_name, last_name, email
FROM Customers;

-- Query 3: Customers from Pune
SELECT *
FROM Customers
WHERE city = 'Pune';

-- Query 4: Products costing more than ₹5000
SELECT *
FROM Products
WHERE price > 5000;

-- Query 5: Products sorted by price
SELECT *
FROM Products
ORDER BY price DESC;

-- Query 6: Top 5 expensive products
SELECT *
FROM Products
ORDER BY price DESC
LIMIT 5;

-- Query 7: Display Orders with Customer Details
SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.total_amount,
    o.order_status
FROM Orders o
INNER JOIN Customers c
ON o.customer_id = c.customer_id;

-- Query 8: Display Products with Category Name
SELECT
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM Products p
INNER JOIN Categories c
ON p.category_id = c.category_id;

-- Query 9: Display Every Ordered Product
SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM Order_Items oi
INNER JOIN Orders o
ON oi.order_id = o.order_id
INNER JOIN Products p
ON oi.product_id = p.product_id;

-- Query 10: Complete Order Report
SELECT
    o.order_id,
    c.first_name,
    p.product_name,
    oi.quantity,
    oi.price,
    o.order_status
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
ON o.order_id = oi.order_id
INNER JOIN Products p
ON oi.product_id = p.product_id;

-- Query 11: Customers Who Have Placed Orders 
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

-- Query 12: Customers Who Never Ordered
SELECT
    c.customer_id,
    c.first_name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Query 13: Total Number of Customers
SELECT COUNT(*) AS total_customers
FROM Customers;

-- Query 14: Total Number of Products
SELECT COUNT(*) AS total_products
FROM Products;

-- Query 15: Average Product Price
SELECT AVG(price) AS average_price
FROM Products;

-- Query 16: Most Expensive Product
SELECT product_name,price
FROM Products
ORDER BY price DESC
LIMIT 1;

-- Query 17: Cheapest Product
SELECT product_name, price
FROM Products
ORDER BY price ASC
LIMIT 1;

-- Query 18: Total Revenue
SELECT SUM(total_amount) AS total_revenue
FROM Orders
WHERE Order_status='Completed';

-- Query 19: Number of Products in Each Category
SELECT c.category_name,COUNT(p.product_id) AS total_products
FROM Categories c
INNER JOIN products p
ON c.category_id=p.category_id
GROUP BY c.category_name;

-- Query 20: Number of Orders Placed by Each Customer
SELECT
    c.first_name,
    COUNT(o.order_id) AS total_orders
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.first_name;

-- Query 21: Average Order Amount
SELECT AVG(total_amount) AS average_order_value
FROM Orders;

-- Query 22: Highest Spending Customer
SELECT
    c.first_name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.first_name
ORDER BY total_spent DESC
LIMIT 1;