USE sales_project;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

INSERT INTO customers (name, email, city, country, signup_date)
VALUES 
('Amit Sharma', 'amit@gmail.com', 'Pune', 'India', '2024-01-10'),
('Neha Patil', 'neha@gmail.com', 'Mumbai', 'India', '2024-02-15'),
('John Doe', 'john.doe@gmail.com', 'New York', 'USA', '2024-03-20'),
('Sara Khan', 'sara.khan@gmail.com', 'Delhi', 'India', '2024-04-05'),
('Michael Lee', 'michael.lee@gmail.com', 'London', 'UK', '2024-05-12');

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2)
);

INSERT INTO products (product_name, category, price, cost_price)
VALUES 
('Laptop', 'Electronics', 55000.00, 45000.00),
('Smartphone', 'Electronics', 25000.00, 18000.00),
('Headphones', 'Electronics', 2000.00, 1200.00),
('Office Chair', 'Furniture', 7000.00, 5000.00),
('Notebook', 'Stationery', 50.00, 30.00),
('Pen Set', 'Stationery', 100.00, 60.00);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES 
(1, '2024-01-10', 55000.00),
(2, '2024-02-15', 25000.00),
(3, '2024-03-20', 2000.00),
(4, '2024-04-05', 7000.00),
(5, '2024-05-12', 150.00);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    sales_price DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_id, product_id, quantity, sales_price)
VALUES 
(1, 1, 1, 55000.00),
(2, 2, 1, 25000.00),
(3, 3, 2, 2000.00),
(4, 4, 1, 7000.00),
(5, 5, 3, 50.00),
(1, 3, 2, 2000.00),
(2, 5, 10, 50.00);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(50),
    amount DECIMAL(10,2),
    status VARCHAR(20),

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments (order_id, payment_date, payment_method, amount, status)
VALUES 
(1, '2024-01-10', 'UPI', 55000.00, 'Completed'),
(2, '2024-02-15', 'Card', 25000.00, 'Completed'),
(3, '2024-03-20', 'Cash', 4000.00, 'Completed'),
(4, '2024-04-05', 'UPI', 7000.00, 'Pending'),
(5, '2024-05-12', 'Net Banking', 150.00, 'Completed'),
(1, '2024-01-11', 'UPI', 10000.00, 'Failed');

