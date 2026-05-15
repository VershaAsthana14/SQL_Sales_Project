ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON DELETE CASCADE;

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE;



ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_products
FOREIGN KEY (product_id)
REFERENCES products(product_id)
ON DELETE RESTRICT;

ALTER TABLE payments
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id)
REFERENCES orders(order_id)
ON DELETE CASCADE;

SELECT 
    table_name, 
    column_name, 
    constraint_name, 
    referenced_table_name
FROM information_schema.key_column_usage
WHERE referenced_table_schema = 'your_database_name';

SELECT 
    c.name,
    o.order_id,
    p.payment_method,
    p.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id;