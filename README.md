

# SQL_DEVELOPER_INTERN
the tasks  given daily will be uploaded in this git repository.
# Date:03/07/2025 Day: Thursday TASK-7:Creating Views
# 1. CREATE VIEW with Complex SELECT  View: order_summary_view
CREATE VIEW order_summary_view AS
SELECT 
    o.order_id,
    c.name AS customer_name,
    o.order_date,
    o.total_amount,
    p.method AS payment_method,
    p.status AS payment_status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments p ON o.order_id = p.order_id;
![image](https://github.com/user-attachments/assets/f8b411b6-0aa6-4e52-9ac5-ebe25b52bfc3)

#  View: cart_details_view
CREATE VIEW cart_details_view AS
SELECT 
    ct.cart_id,
    c.name AS customer_name,
    p.name AS product_name,
    ct.quantity,
    p.price,
    (ct.quantity * p.price) AS total_price
FROM cart ct
JOIN customers c ON ct.customer_id = c.customer_id
JOIN products p ON ct.product_id = p.product_id;
![image](https://github.com/user-attachments/assets/b2effde2-3cc0-4214-8953-54cb0e5b3442)

# View: product_review_view
CREATE VIEW product_review_view AS
SELECT 
    p.product_id,
    p.name AS product_name,
    r.rating,
    r.comment,
    r.date,
    c.name AS reviewer_name
FROM reviews r
JOIN products p ON r.product_id = p.product_id
JOIN customers c ON r.customer_id = c.customer_id;
![image](https://github.com/user-attachments/assets/3842bf87-c07f-4c7d-aa71-4d519b5bddfd)

#  2. Use Views for Abstraction & Security
CREATE A USER: 
![image](https://github.com/user-attachments/assets/f57bcf39-e983-4738-8424-3be134b84de9)
#  Grant Access Only to Specific View
![image](https://github.com/user-attachments/assets/bdb40ff3-819d-4755-b3ff-666a78a570e0)


# Date:01/07/2025 Day:Friday TASK-6:Subqueries and Nested Queries
#  1. Scalar Subqueries
SELECT name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);
![image](https://github.com/user-attachments/assets/ef308344-5f53-4968-9114-5b4cea5ec2da)

SELECT name
FROM customers
WHERE customer_id = (
    SELECT customer_id
    FROM orders
    ORDER BY order_date DESC
    LIMIT 1
);
![image](https://github.com/user-attachments/assets/b195028c-b9dd-409a-a642-c07f0912bc26)


# 2. Correlated Subqueries
SELECT name, price
FROM products p
WHERE price > (
    SELECT AVG(price)
    FROM products
);
![image](https://github.com/user-attachments/assets/2eb57130-37c7-4e3f-95d4-b4b155fef34d)


SELECT name
FROM customers c
WHERE (
    SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) > 1;

![image](https://github.com/user-attachments/assets/3f859afa-7914-4b41-9010-5acc61ba3ccd)

#  3. Subqueries Inside IN, EXISTS, =
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM reviews
);
![image](https://github.com/user-attachments/assets/d85f0bfe-e05e-4925-bd99-afec56e3cacc)

SELECT name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
![image](https://github.com/user-attachments/assets/3124e5a9-52fe-49ab-accc-6e0637e76e59)

SELECT total_amount
FROM orders
WHERE order_id = (
    SELECT MAX(order_id)
    FROM orders
);
![image](https://github.com/user-attachments/assets/da70c097-5647-4460-b0e8-6e291150188b)

# Date:30/06/2025 Day:Monday TASK-5:SQL Joins (Inner, Left, Right, Full)
# INNER JOIN
SELECT orders.order_id, customers.name, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
![image](https://github.com/user-attachments/assets/d73f9408-32a0-43ca-9bbe-abc8a23580e0)

# LEFT JOIN
SELECT customers.name, orders.order_id, orders.total_amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
![image](https://github.com/user-attachments/assets/21ed984f-5dbc-49fa-9e74-367cb3e3b397)

# RIGHT JOIN
SELECT customers.name, orders.order_id, orders.total_amount
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

![image](https://github.com/user-attachments/assets/dab3baea-1714-4680-845f-7c8a2bb2304e)

# FULL JOIN
SELECT customers.name, orders.order_id, orders.total_amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id

UNION

SELECT customers.name, orders.order_id, orders.total_amount
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;
![image](https://github.com/user-attachments/assets/75ccf8ce-e4db-4f82-9544-9dbb574f17fa)


# Date:27/06/2025 Day:Friday TASK-4:Aggregate functions
# SUM:
SELECT SUM(total_amount) AS total_sales
FROM orders;

![image](https://github.com/user-attachments/assets/84b83ab3-dc36-4322-a77c-5e013f777762)

# COUNT
SELECT COUNT(*) AS total_customers
FROM customers;
![image](https://github.com/user-attachments/assets/3cd27c40-1aef-4f3b-9cb6-536a82725472)

# GROUP BY
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

![image](https://github.com/user-attachments/assets/f48c167c-364d-4ac5-a68d-8d4eab7b517d)

# AVG:
SELECT AVG(price) AS avg_price
FROM products;

![image](https://github.com/user-attachments/assets/7fca8748-1726-40c4-b707-ea2ee42cd362)

# HAVING:
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

![image](https://github.com/user-attachments/assets/60889954-9c93-4204-b625-cdad9c8e0660)

# Date:25/06/2025 Day:Wednesday TASK-3: Writing Basic SELECT Queries
Objective:Extract data from one or more tables.
Tools :DB Browser for SQLite / MySQL Workbench
Deliverables:SQL script with SELECT, WHERE, ORDER BY, LIMIT
 # 1. Use SELECT * and Specific Columns
 SELECT * FROM products;
 ![image](https://github.com/user-attachments/assets/98ad2f74-417c-48f3-b8e1-9b7aa62af653)
 
SELECT name, price FROM products;
![image](https://github.com/user-attachments/assets/4de0a216-2f6b-4355-91be-595857139820)

SELECT name, email FROM customers;
![image](https://github.com/user-attachments/assets/07666cef-8d7e-403c-abf8-fbf55f4a9cca)

# 2. Apply WHERE, AND, OR, LIKE, BETWEEN
# Select products where price is greater than 800:
SELECT * FROM products
WHERE price > 800;
![image](https://github.com/user-attachments/assets/70d8bf28-db8f-4c21-bfc1-94a4c2801d89)

# Find customers from Chennai using LIKE:
SELECT * FROM customers
WHERE address LIKE '%Chennai%';
![image](https://github.com/user-attachments/assets/620e01ce-9c75-40a9-89e4-a2bab439e271)

# Find orders placed between two dates:
SELECT * FROM orders
WHERE order_date BETWEEN '2025-06-01' AND '2025-06-30';
![image](https://github.com/user-attachments/assets/b90e491e-ade6-4126-8276-75ec044229f9)


# Find products in category "Electronics" OR price under 800:
SELECT * FROM products
WHERE category = 'Electronics' OR price < 800;
![image](https://github.com/user-attachments/assets/24749e32-48a0-4a67-bbc3-78cd095d9317)

# Get payments made via UPI and completed:
SELECT * FROM payments
WHERE method = 'UPI' AND status = 'Completed';
![image](https://github.com/user-attachments/assets/a1544d05-e14d-4e2e-9124-80b125e41187)

# 3. Sort with ORDER BY
# Sort products by price (low to high):
SELECT * FROM products
ORDER BY price ASC;
![image](https://github.com/user-attachments/assets/08d764d4-b320-4425-a97f-155f87c6864c)

# Sort customers by name (Z to A):
SELECT * FROM customers
ORDER BY name DESC;
![image](https://github.com/user-attachments/assets/31c95f3d-8e00-4dc0-bd60-eedc277a7372)

# Sort orders by order date:
SELECT * FROM orders
ORDER BY order_date DESC;
![image](https://github.com/user-attachments/assets/cb0f87bf-fb4e-4c17-855d-c8618b99c9b2)

# Date:24/06/2025 Day:Tuesday TASK-2: Data Insertion and Handling Nulls
Objective: Practice inserting, updating, and deleting data.
Tools :DB Fiddle / SQLiteStudio
Deliverables: SQL file with INSERT, UPDATE, DELETE statements
# INSERT QUERY:
# Add a new product with some missing optional fields handled by NULL:
INSERT INTO products (product_id, name, description, price, stock_quantity, category)
VALUES (103, 'Bluetooth Keyboard', NULL, 799.00, 50, 'Electronics');
![image](https://github.com/user-attachments/assets/8affcb2b-ba48-4e9a-8b82-4dc7aac410b5)

# Add a new customer with optional phone number missing:
INSERT INTO customers (customer_id, name, email, password_hash, phone, address)
VALUES (2, 'David Lee', 'david@example.com', '$2y$10$newhash', NULL, '789 Hill St, Bangalore, KA');
![image](https://github.com/user-attachments/assets/f8919d75-e3f1-4bf2-898b-27ae419aa97a)

#  Handle Missing Values Using NULL or DEFAULT
ALTER TABLE orders MODIFY status VARCHAR(50) DEFAULT 'Pending';
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1002, 2, '2025-06-24', 1499.00);
![image](https://github.com/user-attachments/assets/a5846db9-9732-4f36-8f06-cae43555e278)

# Use UPDATE and DELETE with WHERE
UPDATE products SET stock_quantity = 120 WHERE product_id = 101;
![image](https://github.com/user-attachments/assets/1f6bcac6-c886-48fb-84f1-0fcd3b24377f)

# DELETE
DELETE FROM reviews WHERE review_id = 1;
![image](https://github.com/user-attachments/assets/64716728-a618-4d70-a317-4d84a83e519b)

# Date:23/06/2025 Day: Monday TASK 1: Database Setup and Schema Design.
Objective: Learn to create databases, tables, and define relationships.
Tools:MySQL Workbench / pgAdmin / SQLiteStudio.
Deliverables: SQL script to create schema and ER diagram
 # Tools used:mysql( wamp server)
# DOMAIN:
# E-COMMERCE
This schema supports a comprehensive e-commerce system including customer and admin management, product listings, shopping cart functionality, order processing, payments, shipping, and product reviews.

# ENTITIES:

# 1. Customers
Primary Key: customer_id

Stores user profile details like name, email, password, and address.

# 2. Admins
Primary Key: admin_id

Stores admin credentials and roles.

# 3. Categories
Primary Key: category_id

Product categorization for easier browsing.

# 4. Products
Primary Key: product_id

Foreign Key: category_id → categories(category_id)

Contains product information such as name, description, price, stock.

# 5. Cart
Primary Key: cart_id

Foreign Keys:

customer_id → customers(customer_id)

product_id → products(product_id)

Stores product selections before purchase.

# 6. Orders
Primary Key: order_id

Foreign Key: customer_id → customers(customer_id)

Represents confirmed purchases made by customers.

# 7. Order_Items
Primary Key: order_item_id

Foreign Keys:

order_id → orders(order_id)

product_id → products(product_id)

Line items within a single order.

# 8. Payments
Primary Key: payment_id

Foreign Key: order_id → orders(order_id)

Payment details per order.

# 9. Shipping
Primary Key: shipping_id

Foreign Key: order_id → orders(order_id)

Shipping status and address.

# 10. Reviews
Primary Key: review_id

Foreign Keys:

customer_id → customers(customer_id)

product_id → products(product_id)

Customer feedback on products.

# CODE:

CUSTOMER TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    phone VARCHAR(15),
    address TEXT
);

ADMIN TABLE
CREATE TABLE admins (
    admin_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    role VARCHAR(50)
);

CATEGORIES TABLE
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100)
);

PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CART TABLE
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

 ORDER ITEMS TABLE
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_each DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

 PAYMENTS TABLE
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SHIPPING TABLE
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20),
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

 REVIEWS TABLE
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
ER DIAGRAM:
![ECOM_ER](https://github.com/user-attachments/assets/1dbb8f54-22a8-40f3-8ace-144ab1e823bd)

OUTPUT SCREENSHOTS:
![image](https://github.com/user-attachments/assets/5822d028-f024-4a22-b368-579bac752ae0)

Admin table:
![image](https://github.com/user-attachments/assets/e7f9022e-8118-411e-813c-aa2fa592a738)

Cart table:
![image](https://github.com/user-attachments/assets/b7baf7d8-2884-4750-bc36-3aee316de49d)

Category table:
![image](https://github.com/user-attachments/assets/c9e2804f-1be9-46be-988f-2cd7b6cc80eb)

Customers table:
![image](https://github.com/user-attachments/assets/2f0bc581-70e0-4ea6-ab9e-441c58e977ad)

Orders table:
![image](https://github.com/user-attachments/assets/42bbf068-bd2a-4323-962c-c07dc17aef1d)

Order_items table:
![image](https://github.com/user-attachments/assets/1aebb822-bf40-4ecb-82a2-2313bd80d48a)

Payments table:
![image](https://github.com/user-attachments/assets/1f6aa139-3978-493f-b2bb-6f5d98e76452)

Products table:
![image](https://github.com/user-attachments/assets/e9769437-7b16-4cec-99c7-20faa3d57335)

Reviews table:
![image](https://github.com/user-attachments/assets/dec4c13b-836e-48a4-aeb9-5c981af09c22)

Shipping table:
![image](https://github.com/user-attachments/assets/3c05b677-433e-4b67-b1e7-f658c6f287ec)

