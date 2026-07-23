CREATE INDEX idx_products_category
ON Products(category_id);

CREATE INDEX idx_orders_customer
ON Orders(customer_id);

CREATE INDEX idx_order_items_order
ON Order_Items(order_id);

CREATE INDEX idx_order_items_product
ON Order_Items(product_id);

CREATE INDEX idx_payments_order
ON Payments(order_id);

SHOW INDEX FROM Products;
SHOW INDEX FROM Orders;