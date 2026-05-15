#Total Sales Revenue
SELECT SUM(total_amount) AS total_revenue
FROM Orders;

#Monthly Sales Trend
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(total_amount) AS revenue
FROM Orders
GROUP BY month
ORDER BY month;

#Top 2 Customers
SELECT 
  c.name,
  SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;

#Best Selling Products
SELECT 
  p.product_name,
  SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

#Sales by Region
SELECT 
  city,
  SUM(total_amount) AS revenue
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY city;

#Payment Method Analysis
SELECT 
  payment_method,
  COUNT(*) AS transactions,
  SUM(amount) AS total_amount
FROM Payments
GROUP BY payment_method;

#Customer Lifetime Value (CLV)
SELECT 
  customer_id,
  SUM(total_amount) AS lifetime_value
FROM Orders
GROUP BY customer_id;

#Month-over-Month Growth
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  SUM(total_amount) AS revenue,
  LAG(SUM(total_amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) AS prev_month
FROM Orders
GROUP BY month;