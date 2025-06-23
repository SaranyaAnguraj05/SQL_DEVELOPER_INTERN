
-- CUSTOMER TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    phone VARCHAR(15),
    address TEXT
);

INSERT INTO customers VALUES
(1, 'Alice Smith', 'alice@example.com', '$2y$10$hash1', '9876543210', '123 Main St, Chennai, TN');

-- ADMIN TABLE
CREATE TABLE admins (
    admin_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    role VARCHAR(50)
);

INSERT INTO admins VALUES
(1, 'Bob Admin', 'bobadmin@example.com', '$2y$10$hash2', 'superadmin');

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    category VARCHAR(50)
);

INSERT INTO products VALUES
(101, 'Wireless Mouse', 'Ergonomic, USB receiver', 699.00, 150, 'Electronics'),
(102, 'Hoodie', 'Cotton, blue, unisex', 999.00, 80, 'Clothing');

-- CART TABLE
CREATE TABLE cart (
    cart_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO cart VALUES
(1, 1, 101, 2),
(2, 1, 102, 1);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50)
);

INSERT INTO orders VALUES
(1001, 1, '2025-06-23', 2397.00, 'Processing');

-- ORDER_ITEMS TABLE
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price_each DECIMAL(10, 2)
);

INSERT INTO order_items VALUES
(1, 1001, 101, 2, 699.00),
(2, 1001, 102, 1, 999.00);

-- PAYMENTS TABLE
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    method VARCHAR(50),
    status VARCHAR(50)
);

INSERT INTO payments VALUES
(501, 1001, '2025-06-23', 2397.00, 'UPI', 'Completed');

-- CATEGORIES TABLE
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Clothing');

-- REVIEWS TABLE
CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    comment TEXT,
    date DATE
);

INSERT INTO reviews VALUES
(1, 1, 101, 4, 'Great mouse, smooth!', '2025-06-22');

-- SHIPPING TABLE
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    zip VARCHAR(20),
    status VARCHAR(50)
);

INSERT INTO shipping VALUES
(301, 1001, '123 Main St, Apartment 4B', 'Chennai', 'Tamil Nadu', '600001', 'In Transit');
