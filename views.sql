USE ecommerce_db;
-- View 1: Customer Orders
CREATE VIEW CustomerOrders AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id;

SELECT * FROM CustomerOrders;

-- View 2: Product Sales Summary
CREATE VIEW ProductSales AS
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * oi.price) AS total_sales
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT * FROM ProductSales;

-- View 3: Category Revenue
CREATE VIEW CategoryRevenue AS
SELECT
    c.category_name,
    SUM(oi.quantity * oi.price) AS revenue
FROM Categories c
JOIN Products p
ON c.category_id = p.category_id
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY c.category_name;

SELECT * FROM CategoryRevenue;
