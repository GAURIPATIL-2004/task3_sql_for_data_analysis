-- Customers table
use gauri;
CREATE TABLE Customers1 (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATE
);

-- Products table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert into customers
INSERT INTO Customers1 (name, email, created_at) VALUES
('Gauri Patil', 'gauri@example.com', '2023-01-15'),
('Vedant Patil', 'vp@example.com', '2023-02-10'),
('Adinath Patil', 'adi@example.com', '2023-03-05');

-- Insert into products
INSERT INTO products (name, category, price) VALUES
('Laptop', 'Electronics', 999.99),
('Headphones', 'Electronics', 199.99),
('Keyboard', 'Accessories', 49.99),
('Mouse', 'Accessories', 29.99),
('Monitor', 'Electronics', 299.99);

-- Insert into orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2023-04-01', 1299.97),
(2, '2023-04-03', 49.99),
(1, '2023-04-10', 229.98);

-- Insert into order_items
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 199.99),
(1, 3, 2, 49.99),
(2, 3, 1, 49.99),
(3, 4, 2, 29.99),
(3, 2, 1, 199.99);


-- 1. Total Revenue Per Customer
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_revenue
FROM Customers1 c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_revenue DESC;

-- 2. Top 5 Products by Revenue
SELECT p.name, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY revenue DESC
LIMIT 5;

-- 3. Customers With No Orders
SELECT c.customer_id, c.name
FROM Customers1 c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 4. Average Order Amount
SELECT AVG(total_amount) AS avg_order_amount FROM orders;

-- 5. Monthly Revenue Trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS revenue
FROM orders
GROUP BY month;

-- 6. Create a View for Revenue per Product
CREATE VIEW product_revenue AS
SELECT p.product_id, p.name, SUM(oi.quantity * oi.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name;

-- 7. Customers Who Spent More Than $500
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_spent
FROM Customers1 c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING total_spent > 500;

-- 8. Subquery: Products Ordered More Than Once
SELECT name FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_items
    GROUP BY product_id
    HAVING COUNT(*) > 1
);

-- Create Indexes
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_product_id ON order_items(product_id);
CREATE INDEX idx_category ON products(category);

-- Use EXPLAIN on a complex query
EXPLAIN
SELECT p.name, SUM(oi.quantity * oi.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY revenue DESC;
