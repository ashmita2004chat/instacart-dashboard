CREATE DATABASE instacart_db;
USE instacart_db;
-- Table: aisles
CREATE TABLE aisles (
    aisle_id INT PRIMARY KEY,
    aisle VARCHAR(255)
);

-- Table: departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department VARCHAR(255)
);

-- Table: orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    eval_set ENUM('prior', 'train', 'test'),
    order_number INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order FLOAT
);

-- Table: order_products_prior
CREATE TABLE order_products_prior (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table: order_products_train
CREATE TABLE order_products_train (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

SELECT COUNT(*) FROM products;



DELETE FROM products;


SHOW VARIABLES LIKE 'secure_file_priv';

SELECT COUNT(*) FROM products;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, aisle_id, department_id);

ALTER TABLE products MODIFY COLUMN product_name VARCHAR(1000);
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM products;
SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, aisle_id, department_id);

ALTER TABLE products MODIFY COLUMN product_name TEXT;

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM products;
SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, aisle_id, department_id);

SELECT product_id FROM products;





LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/missing_products_333_rows.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, aisle_id, department_id);


SELECT product_id FROM products LIMIT 50000;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/final_missing_333_products.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, aisle_id, department_id);

SELECT COUNT(*) FROM products;

DELETE FROM orders;
SELECT COUNT(*) FROM orders;

DELETE FROM orders;
SELECT COUNT(*) FROM orders;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE orders;
SET FOREIGN_KEY_CHECKS = 1;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    eval_set VARCHAR(20),
    order_number INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order INT
);

ALTER TABLE orders 
MODIFY COLUMN days_since_prior_order INT NULL;


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE orders;
SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day, @days_since)
SET days_since_prior_order = NULLIF(@days_since, '');


SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE orders;
SET FOREIGN_KEY_CHECKS = 1;

DESCRIBE orders;

ALTER TABLE orders DROP PRIMARY KEY;

SELECT 
    TABLE_NAME, 
    CONSTRAINT_NAME 
FROM 
    information_schema.KEY_COLUMN_USAGE 
WHERE 
    REFERENCED_TABLE_NAME = 'orders' 
    AND REFERENCED_COLUMN_NAME = 'order_id';
    
    ALTER TABLE order_products_prior DROP FOREIGN KEY order_products_prior_ibfk_1;
ALTER TABLE order_products_train DROP FOREIGN KEY order_products_train_ibfk_1;

ALTER TABLE orders DROP PRIMARY KEY;

ALTER TABLE orders MODIFY days_since_prior_order FLOAT NULL;

ALTER TABLE orders MODIFY eval_set VARCHAR(20);


DESCRIBE orders;



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_mysql_ready.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day, days_since_prior_order)
SET days_since_prior_order = NULLIF(days_since_prior_order, '');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders_mysql_ready.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, user_id, eval_set, order_number, order_dow, order_hour_of_day, @tmp_days)
SET days_since_prior_order = NULLIF(TRIM(@tmp_days), '');

SELECT * FROM orders LIMIT 10;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products__prior.csv'
INTO TABLE order_products_prior
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);



SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM order_products_prior
LIMIT 1000000;

-- Repeat the above DELETE multiple times until:
-- SELECT COUNT(*) FROM order_products_prior; returns 0

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE order_products_prior_v2 (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_prior_part1.csv'
INTO TABLE order_products_prior_v2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_prior_part2.csv'
INTO TABLE order_products_prior_v2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_prior_part3.csv'
INTO TABLE order_products_prior_v2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_prior_part4.csv'
INTO TABLE order_products_prior_v2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

SELECT COUNT(*) FROM order_products_prior_v2;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products__train.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);



LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part2.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part3.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

SELECT COUNT(*) FROM order_products_train;

CREATE TABLE order_products_train_clean AS
SELECT DISTINCT * FROM order_products_train;

SELECT DISTINCT product_id, COUNT(*) AS reorder_count
FROM order_products_train
WHERE reordered = 1
GROUP BY product_id
ORDER BY reorder_count DESC
LIMIT 10;


SELECT product_id, COUNT(*) AS reorder_count
FROM (
    SELECT * FROM order_products_train
    WHERE reordered = 1
    LIMIT 500000
) AS limited_data
GROUP BY product_id
ORDER BY reorder_count DESC
LIMIT 10;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part1.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS


CREATE TABLE order_products_train (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part1.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

SELECT COUNT(*) FROM order_products_train;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part1.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

DROP TABLE IF EXISTS order_products_train;

CREATE TABLE order_products_train (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part1.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part2.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_products_train_part3.csv'
INTO TABLE order_products_train
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, product_id, add_to_cart_order, reordered);

SELECT COUNT(*) FROM order_products_train;


#Which Prouducts are reordered the most?
SELECT 
    p.product_name,
    COUNT(*) AS total_reorders
FROM 
    order_products_train opt
JOIN 
    products p ON opt.product_id = p.product_id
WHERE 
    reordered = 1
GROUP BY 
    p.product_name
ORDER BY 
    total_reorders DESC
LIMIT 10;

#What are the top 3 products each user frequently reorders?
SELECT 
    o.user_id,
    p.product_name,
    COUNT(*) AS reorder_count
FROM 
    orders o
JOIN 
    order_products_train opt ON o.order_id = opt.order_id
JOIN 
    products p ON opt.product_id = p.product_id
WHERE 
    opt.reordered = 1
GROUP BY 
    o.user_id, p.product_name
HAVING 
    reorder_count >= 2
ORDER BY 
    o.user_id, reorder_count DESC;

#What aisle does each user shop from the most?
SELECT 
    o.user_id,
    a.aisle,
    COUNT(*) AS aisle_count
FROM 
    orders o
JOIN 
    order_products_train opt ON o.order_id = opt.order_id
JOIN 
    products p ON opt.product_id = p.product_id
JOIN 
    aisles a ON p.aisle_id = a.aisle_id
GROUP BY 
    o.user_id, a.aisle
ORDER BY 
    o.user_id, aisle_count DESC;
    
#How loyal is each user to items they've bought before?
SELECT 
    o.user_id,
    ROUND(SUM(opt.reordered) / COUNT(*), 2) AS reorder_ratio
FROM 
    orders o
JOIN 
    order_products_train opt ON o.order_id = opt.order_id
GROUP BY 
    o.user_id
ORDER BY 
    reorder_ratio DESC;
    

#What is the average number of days between orders for each user?
SELECT 
    user_id,
    AVG(days_since_prior_order) AS avg_order_gap,
    COUNT(*) AS total_orders
FROM 
    orders
WHERE 
    eval_set = 'prior' AND days_since_prior_order IS NOT NULL
GROUP BY 
    user_id
ORDER BY 
    avg_order_gap;
    
#Which pairs of products are most frequently purchased together in the same order?

CREATE TABLE limited_orders_perm AS
SELECT DISTINCT order_id
FROM order_products_prior_v2
LIMIT 20000;


CREATE TABLE limited_products_perm AS
SELECT opp.*
FROM order_products_prior_v2 opp
JOIN limited_orders_perm lo
ON opp.order_id = lo.order_id;

SELECT 
    p1.product_id AS product_1,
    p2.product_id AS product_2,
    COUNT(*) AS frequency
FROM 
    limited_products_perm p1
JOIN 
    limited_products_perm p2
ON 
    p1.order_id = p2.order_id 
    AND p1.product_id < p2.product_id
GROUP BY 
    product_1, product_2
ORDER BY 
    frequency DESC
LIMIT 20;

SELECT 
    pr1.product_name AS product_1,
    pr2.product_name AS product_2,
    pairs.frequency
FROM (
    SELECT 
        p1.product_id AS product_1,
        p2.product_id AS product_2,
        COUNT(*) AS frequency
    FROM 
        limited_products_perm p1
    JOIN 
        limited_products_perm p2
    ON 
        p1.order_id = p2.order_id 
        AND p1.product_id < p2.product_id
    GROUP BY 
        product_1, product_2
    ORDER BY 
        frequency DESC
    LIMIT 20
) AS pairs
JOIN products pr1 ON pairs.product_1 = pr1.product_id
JOIN products pr2 ON pairs.product_2 = pr2.product_id;

#Who are the top 5 usrs with highest reorder rates (i.e. proportion of reordered items to total items reordered?

SELECT 
    o.user_id,
    COUNT(CASE WHEN t.reordered = 1 THEN 1 END) * 1.0 / COUNT(*) AS reorder_rate,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN t.reordered = 1 THEN 1 END) AS total_reorders
FROM order_products_train t
JOIN orders o ON t.order_id = o.order_id
GROUP BY o.user_id
HAVING COUNT(*) >= 10  -- Optional: Filter out users with very few orders
ORDER BY reorder_rate DESC
LIMIT 5;


#BASIC PRODUCT RECOMMENDATION

SELECT 
    o.user_id,
    p.product_name,
    COUNT(*) AS reorder_count
FROM 
    order_products_train opt
JOIN 
    orders o ON opt.order_id = o.order_id
JOIN 
    products p ON opt.product_id = p.product_id
WHERE 
    opt.reordered = 1
GROUP BY 
    o.user_id, p.product_name
ORDER BY 
    o.user_id, reorder_count DESC;


SELECT order_id, COUNT(*) 
FROM orders 
GROUP BY order_id 
HAVING COUNT(*) > 1;

CREATE TABLE orders_clean AS
SELECT 
    order_id,
    ANY_VALUE(user_id) AS user_id,
    ANY_VALUE(eval_set) AS eval_set,
    ANY_VALUE(order_number) AS order_number,
    ANY_VALUE(order_dow) AS order_dow,
    ANY_VALUE(order_hour_of_day) AS order_hour_of_day,
    ANY_VALUE(days_since_prior_order) AS days_since_prior_order
FROM orders
GROUP BY order_id;

SELECT order_id, COUNT(*) AS count
FROM orders_clean
GROUP BY order_id
HAVING COUNT(*) > 1;

CREATE TABLE top_aisle_summary AS
SELECT 
    oc.user_id,
    a.aisle,
    COUNT(*) AS aisle_count
FROM 
    orders_clean oc
JOIN 
    order_products_prior_v2 opp ON oc.order_id = opp.order_id
JOIN 
    products p ON opp.product_id = p.product_id
JOIN 
    aisles a ON p.aisle_id = a.aisle_id
GROUP BY 
    oc.user_id, a.aisle;

SELECT COUNT(*) FROM top_aisle_summary;

CREATE TABLE users AS
SELECT DISTINCT user_id FROM orders_clean;


CREATE TABLE most_reordered_products AS
SELECT 
    p.product_id,
    p.product_name,
    COUNT(*) AS total_reorders
FROM 
    order_products_prior_v2 opp
JOIN 
    products p ON opp.product_id = p.product_id
WHERE 
    opp.reordered = 1
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    total_reorders DESC;


CREATE TABLE reorder_fact AS
SELECT
    o.user_id,
    o.order_id,
    op.product_id,
    p.product_name,
    op.reordered
FROM
    order_products_prior_v2 op
JOIN
    orders_clean o ON o.order_id = op.order_id
JOIN
    products p ON p.product_id = op.product_id;


CREATE TABLE order_product_reorders_full AS
SELECT
    o.user_id,
    o.order_id,
    op.product_id,
    p.product_name,
    op.reordered
FROM
    orders_clean o
JOIN (
    SELECT * FROM order_products_prior_v2
    UNION ALL
    SELECT * FROM order_products_train
) op ON o.order_id = op.order_id
JOIN products p ON p.product_id = op.product_id;

SELECT COUNT(DISTINCT user_id) FROM orders_clean;
SELECT COUNT(DISTINCT user_id) FROM orders;

CREATE TABLE user_loyalty_score AS
SELECT
    o.user_id,
    ROUND(SUM(CASE WHEN op.reordered = 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) , 4) AS reorder_ratio
FROM
    orders_clean o
JOIN
    order_products_prior_v2 op ON o.order_id = op.order_id
GROUP BY
    o.user_id;






