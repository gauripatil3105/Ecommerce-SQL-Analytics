USE ecommerce_db;

INSERT INTO Categories (category_name, description) VALUES
('Electronics', 'Electronic gadgets and devices'),
('Clothing', 'Men and Women clothing'),
('Books', 'Educational and Story books'),
('Home Appliances', 'Home and Kitchen appliances'),
('Sports', 'Sports equipment');

INSERT INTO Customers (first_name, last_name, email, phone, city, state) VALUES
('Rahul', 'Sharma', 'rahul.sharma@gmail.com', '9876543210', 'Pune', 'Maharashtra'),
('Priya', 'Patil', 'priya.patil@gmail.com', '9876543211', 'Mumbai', 'Maharashtra'),
('Amit', 'Verma', 'amit.verma@gmail.com', '9876543212', 'Nagpur', 'Maharashtra'),
('Sneha', 'Kulkarni', 'sneha.kulkarni@gmail.com', '9876543213', 'Nashik', 'Maharashtra'),
('Rohan', 'Joshi', 'rohan.joshi@gmail.com', '9876543214', 'Kolhapur', 'Maharashtra');

INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('Laptop', 1, 65000.00, 25),
('Smartphone', 1, 30000.00, 40),
('Bluetooth Speaker', 1, 2500.00, 60),
('T-Shirt', 2, 799.00, 100),
('Jeans', 2, 1499.00, 70),
('Java Programming Book', 3, 650.00, 50),
('Data Structures Book', 3, 850.00, 30),
('Mixer Grinder', 4, 4500.00, 20),
('Cricket Bat', 5, 2200.00, 35),
('Football', 5, 900.00, 45);

SELECT * FROM Products;

USE ecommerce_db;

INSERT INTO Orders (customer_id, order_date, total_amount, order_status) VALUES
(1, '2026-07-01', 65000.00, 'Completed'),
(2, '2026-07-02', 30799.00, 'Completed'),
(3, '2026-07-03', 2200.00, 'Pending'),
(1, '2026-07-04', 1550.00, 'Completed'),
(4, '2026-07-05', 4500.00, 'Shipped'),
(5, '2026-07-06', 900.00, 'Completed'),
(2, '2026-07-07', 2500.00, 'Cancelled'),
(3, '2026-07-08', 650.00, 'Completed');

SELECT * FROM Orders;

USE ecommerce_db;

INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 65000.00),    
(2, 2, 1, 30000.00),      
(2, 4, 1, 799.00),        
(3, 9, 1, 2200.00),      
(4, 5, 1, 1499.00),       
(4, 6, 1, 650.00),        
(5, 8, 1, 4500.00),      
(6, 10, 1, 900.00),      
(7, 3, 1, 2500.00),       
(8, 6, 1, 650.00);       

USE ecommerce_db;

INSERT INTO Payments (order_id, payment_method, payment_status, payment_date) VALUES
(1, 'Credit Card', 'Completed', '2026-07-01'),
(2, 'UPI', 'Completed', '2026-07-02'),
(3, 'Cash on Delivery', 'Pending', NULL),
(4, 'Debit Card', 'Completed', '2026-07-04'),
(5, 'Net Banking', 'Completed', '2026-07-05'),
(6, 'UPI', 'Completed', '2026-07-06'),
(7, 'Credit Card', 'Cancelled', NULL),
(8, 'UPI', 'Completed', '2026-07-08');

SELECT * FROM Payments;