# SQL_DEVELOPER_INTERN
the tasks  given daily will be uploaded in this git repository.
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

