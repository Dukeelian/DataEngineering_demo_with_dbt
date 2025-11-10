CREATE DATABASE ETL_prod;


CREATE SCHEMA raw;
CREATE SCHEMA geo;
CREATE SCHEMA hr;
CREATE SCHEMA inventory;


CREATE TABLE geo.countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100),
    region VARCHAR(100)
);


INSERT INTO geo.countries VALUES
(1, 'India', 'Asia'),
(2, 'USA', 'North America'),
(3, 'Germany', 'Europe'),
(4, NULL, 'Europe'),
(5, 'Japan', 'Asia');



CREATE TABLE geo.cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100),
    country_id INT REFERENCES geo.countries(country_id),
    population INT
);

INSERT INTO geo.cities VALUES
(1, 'Mumbai', 1, 20000000),
(2, 'New York', 2, 9000000),
(3, 'Berlin', 3, -200000),
(4, 'Tokyo', 5, 13000000),
(5, NULL, 1, 1200000);


CREATE TABLE hr.departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO hr.departments VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Sales'),
(4, 'Support'),
(5, NULL);


CREATE TABLE hr.employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    hire_date DATE,
    dept_id INT REFERENCES hr.departments(dept_id),
    job_title VARCHAR(100),
    salary INT
);

INSERT INTO hr.employees VALUES
(1, 'Rahul', 'Sharma', 'rahul@corp.com', '2021-01-10', 1, 'Engineer', 60000),
(2, 'Ananya', 'Gupta', NULL, '2022-03-15', 2, 'Marketing Lead', -45000),
(3, 'John', 'Doe', 'john@corp.com', '2020-06-10', 3, 'Sales Executive', 55000),
(4, 'Priya', 'Nair', 'priya@corp.com', NULL, NULL, 'HR Assistant', 35000),
(5, 'Aman', 'Verma', 'aman@corp.com', '2023-04-05', 5, 'Developer', 0);


CREATE TABLE raw.customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender VARCHAR(10),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    country VARCHAR(100),
    signup_date DATE
);

INSERT INTO raw.customers VALUES
(1, 'Neha', 'Singh', 'F', 'neha@email.com', '9812345678', 'Mumbai', 'India', '2022-03-10'),
(2, NULL, 'Kumar', 'M', 'ravi@email.com', NULL, 'Delhi', 'India', '2021-07-21'),
(3, 'Robert', 'Miller', 'Male', 'rob.m@email.com', '2128899911', 'New York', 'USA', '2020-08-30'),
(4, 'Aiko', 'Tanaka', 'F', 'aiko@jp.com', NULL, 'Tokyo', 'Japan', '2023-01-01'),
(5, 'Priyanka', NULL, 'Female', 'priya@email.com', '9888899999', NULL, 'India', NULL);



CREATE TABLE raw.products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price INT,
    stock INT,
    supplier_id INT
);

INSERT INTO raw.products VALUES
(1, 'Laptop', 'Electronics', 80000, 15, 1),
(2, 'Headphones', 'Electronics', 2500, NULL, 1),
(3, 'Coffee Mug', 'Homeware', 400, 500, 2),
(4, 'Shirt', 'Apparel', NULL, 300, 3),
(5, 'Pen', 'Stationery', 10, 2000, 2);


CREATE TABLE raw.orders (
    order_id INT PRIMARY KEY,
    customer_id INT REFERENCES raw.customers(customer_id),
    order_date DATE,
    total_amount INT,
    payment_id INT,
    status VARCHAR(20)
);

INSERT INTO raw.orders VALUES
(1001, 1, '2023-10-10', 82000, 5001, 'Completed'),
(1002, 2, '2023-10-15', -5000, 5002, 'Pending'),
(1003, 3, '2023-11-01', 1500, 5003, NULL),
(1004, 4, '2023-11-02', 400, NULL, 'Completed'),
(1005, 5, '2023-11-04', 12000, 5005, 'Cancelled');

CREATE TABLE raw.order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES raw.orders(order_id),
    product_id INT REFERENCES raw.products(product_id),
    quantity INT,
    subtotal INT
);

INSERT INTO raw.order_items VALUES
(1, 1001, 1, 1, 80000),
(2, 1001, 2, 1, 2000),
(3, 1002, 3, 10, -5000),
(4, 1003, 4, 1, 400),
(5, 1005, 5, 1200, 12000);



CREATE TABLE inventory.warehouses (
    warehouse_id INT PRIMARY KEY,
    warehouse_name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100),
    capacity INT
);

INSERT INTO inventory.warehouses VALUES
(1, 'Mumbai Central', 'Mumbai', 'India', 2000),
(2, 'NY Storage', 'New York', 'USA', 3500),
(3, 'Tokyo Hub', 'Tokyo', 'Japan', NULL),
(4, 'Delhi Depot', 'Delhi', 'India', 1000);


CREATE TABLE inventory.stock_movements (
    movement_id INT PRIMARY KEY,
    product_id INT REFERENCES raw.products(product_id),
    warehouse_id INT REFERENCES inventory.warehouses(warehouse_id),
    movement_type VARCHAR(10),
    quantity INT,
    movement_date DATE
);

INSERT INTO inventory.stock_movements VALUES
(1, 1, 1, 'IN', 15, '2023-11-01'),
(2, 1, 2, 'OUT', -2, '2023-11-02'),
(3, 3, 3, 'IN', 50, '2023-11-02'),
(4, 5, 4, 'OUT', -10, '2023-11-04'),
(5, 4, 1, 'IN', 25, '2023-11-05');





-- ---------------------------
-- 1) marketing_campaigns
-- ---------------------------
CREATE TABLE IF NOT EXISTS raw.marketing_campaigns (
    campaign_id    INT PRIMARY KEY,
    campaign_name  VARCHAR(150),
    start_date     DATE,
    end_date       DATE,
    budget         NUMERIC,
    target_audience VARCHAR(200),
    product_id     INT REFERENCES raw.products(product_id)
);

INSERT INTO raw.marketing_campaigns (campaign_id, campaign_name, start_date, end_date, budget, target_audience, product_id) VALUES
(1, 'Festive Sale 2023', '2023-10-01', '2023-10-31', 500000, 'All customers - India', 1),
(2, 'Black Friday Promo', '2023-11-20', '2023-11-27', 350000, 'High-spend customers', 2),
(3, 'Winter Essentials', '2023-12-01', '2023-12-31', 120000, 'Homeware shoppers', 3),
(4, 'Apparel Clearance', '2023-09-15', '2023-10-15', 80000, 'Apparel category buyers', 4),
(5, 'Stationery Bulk Offer', '2023-11-01', '2023-11-30', 20000, 'Schools & colleges', 5);


-- ---------------------------
-- 2) payments
-- ---------------------------
CREATE TABLE IF NOT EXISTS raw.payments (
    payment_id    INT PRIMARY KEY,
    payment_method VARCHAR(50),
    payment_date   DATE,
    amount         NUMERIC,
    currency       VARCHAR(10)
);

-- Note: these payment_ids correspond to orders 1001..1005 used earlier
INSERT INTO raw.payments (payment_id, payment_method, payment_date, amount, currency) VALUES
(5001, 'Credit Card',  '2023-10-10', 82000, 'INR'),
(5002, 'UPI',          '2023-10-15', -5000, 'INR'),   -- messy negative amount to test cleaning
(5003, 'PayPal',       '2023-11-01', 1500,  'USD'),
(5004, 'Bank Transfer','2023-11-02', 400,   'INR'),
(5005, 'Netbanking',   '2023-11-04', 12000, 'INR');


-- ---------------------------
-- 3) shipments
-- ---------------------------
CREATE TABLE IF NOT EXISTS raw.shipments (
    shipment_id   INT PRIMARY KEY,
    order_id      INT REFERENCES raw.orders(order_id),
    courier_name  VARCHAR(100),
    shipped_date  DATE,
    delivery_date DATE,
    status        VARCHAR(50)
);

INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES
(2001, 1001, 'BlueEx Courier', '2023-10-11', '2023-10-14', 'Delivered'),
(2002, 1002, 'FastShip',       '2023-10-16', '2023-10-20', 'In Transit'),
(2003, 1003, 'QuickDrop',      '2023-11-01', NULL,         'Shipped'),
(2004, 1004, 'BlueEx Courier', '2023-11-03', '2023-11-05', 'Delivered'),
(2005, 1005, 'LocalExpress',   NULL,         NULL,         'Pending');


-- ---------------------------
-- 4) suppliers
-- ---------------------------
CREATE TABLE IF NOT EXISTS raw.suppliers (
    supplier_id    INT PRIMARY KEY,
    supplier_name  VARCHAR(150),
    contact_person VARCHAR(100),
    contact_email  VARCHAR(150),
    country        VARCHAR(100)
);

INSERT INTO raw.suppliers (supplier_id, supplier_name, contact_person, contact_email, country) VALUES
(1, 'ElectroGoods Pvt Ltd', 'Mr. Ramesh Iyer', 'ramesh@electrogoods.com', 'India'),
(2, 'Homeware Supplies Co', 'Ms. Lina Kapoor', 'lina@homewareco.com', 'India'),
(3, 'Apparel Makers Ltd', 'Mr. Mark Johnson', 'mark@apparel.com', 'USA'),
(4, 'Stationery World', 'Ms. S. Rao', 'sales@stationeryworld.com', 'India'),
(5, 'AudioWorks', 'Mr. Ken Tan', 'ken@audioworks.jp', 'Japan');


-- ---------------------------
-- 5) support_tickets
-- ---------------------------
CREATE TABLE IF NOT EXISTS raw.support_tickets (
    ticket_id    INT PRIMARY KEY,
    customer_id  INT REFERENCES raw.customers(customer_id),
    issue_type   VARCHAR(100),
    status       VARCHAR(50),
    created_at   TIMESTAMP,
    resolved_at  TIMESTAMP
);

INSERT INTO raw.support_tickets (ticket_id, customer_id, issue_type, status, created_at, resolved_at) VALUES
(9001, 1, 'Payment failure',       'Resolved', '2023-10-11 09:15:00', '2023-10-11 12:00:00'),
(9002, 2, 'Missing phone number',  'Open',     '2023-10-16 10:00:00', NULL),
(9003, 3, 'Wrong address',         'Resolved', '2023-11-02 14:30:00', '2023-11-03 11:00:00'),
(9004, 4, 'Delayed delivery',      'Investigating', '2023-11-05 08:00:00', NULL),
(9005, 5, 'Product quality',       'Closed',   '2023-11-06 16:45:00', '2023-11-08 10:00:00');










INSERT INTO geo.cities (city_id, city_name, population, country_id)
VALUES 
    (501, 'Guwahati', 957352, 1),
    (502, 'Dibrugarh', 138661, 1),
    (503, 'Silchar', 172830, 1)
ON CONFLICT (city_id) DO NOTHING;

INSERT INTO hr.departments (dept_id, dept_name)
VALUES 
    (999, 'Unassigned Department')
ON CONFLICT (dept_id) DO NOTHING;


INSERT INTO raw.payments (payment_id, payment_method, payment_date, amount, currency)
VALUES 
    (7001, 'Credit Card', '2024-11-01', 2300, 'INR'),
    (7002, 'UPI', '2024-11-05', 1150, 'INR'),
    (7003, 'Cash', '2024-11-06', 560, 'INR')
ON CONFLICT (payment_id) DO NOTHING;

-- Check new cities
SELECT * FROM geo.cities WHERE city_id >= 501;

-- Check new department
SELECT * FROM hr.departments WHERE dept_id = 999;

-- Check new payments
SELECT * FROM raw.payments WHERE payment_id >= 7001;



































-- Show offending dept_ids and sample rows
SELECT DISTINCT c.city
FROM raw.customers c
LEFT JOIN geo.cities ci ON LOWER(TRIM(c.city)) = LOWER(TRIM(ci.city_name))
WHERE ci.city_name IS NULL
AND c.city IS NOT NULL;



INSERT INTO geo.cities (city_id, city_name, country_id, population)
SELECT 
    (SELECT COALESCE(MAX(city_id), 0) + ROW_NUMBER() OVER() FROM geo.cities),
    TRIM(c.city),
    1 AS country_id,          -- default fallback
    NULL AS population
FROM raw.customers c
LEFT JOIN geo.cities ci ON LOWER(TRIM(c.city)) = LOWER(TRIM(ci.city_name))
WHERE ci.city_name IS NULL
AND c.city IS NOT NULL;







SELECT DISTINCT e.dept_id
FROM hr.employees e
LEFT JOIN hr.departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL
AND e.dept_id IS NOT NULL;




INSERT INTO hr.departments (dept_id, dept_name)
SELECT DISTINCT e.dept_id, CONCAT('AutoGenerated Dept ', e.dept_id)
FROM hr.employees e
LEFT JOIN hr.departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL
AND e.dept_id IS NOT NULL;





SELECT DISTINCT o.payment_id
FROM raw.orders o
LEFT JOIN raw.payments p ON o.payment_id = p.payment_id
WHERE p.payment_id IS NULL
AND o.payment_id IS NOT NULL;




INSERT INTO raw.payments (payment_id, payment_method, payment_date, amount, currency)
SELECT DISTINCT o.payment_id, 'Unknown', CURRENT_DATE, 0, 'INR'
FROM raw.orders o
LEFT JOIN raw.payments p ON o.payment_id = p.payment_id
WHERE p.payment_id IS NULL
AND o.payment_id IS NOT NULL;






SELECT phone, COUNT(*) 
FROM raw.customers
WHERE phone IS NOT NULL
GROUP BY phone
HAVING COUNT(*) > 1;



DELETE FROM raw.customers r
USING (
    SELECT customer_id
    FROM (
      SELECT customer_id,
             ROW_NUMBER() OVER (PARTITION BY phone ORDER BY signup_date DESC) AS rn
      FROM raw.customers
      WHERE phone IS NOT NULL
    ) x
    WHERE x.rn > 1
) dup
WHERE r.customer_id = dup.customer_id;





































