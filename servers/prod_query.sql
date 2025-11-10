--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-11-11 03:48:28

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 45844)
-- Name: geo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA geo;


ALTER SCHEMA geo OWNER TO postgres;

--
-- TOC entry 8 (class 2615 OID 45845)
-- Name: hr; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hr;


ALTER SCHEMA hr OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 45846)
-- Name: inventory; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA inventory;


ALTER SCHEMA inventory OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 45843)
-- Name: raw; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA raw;


ALTER SCHEMA raw OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 260 (class 1259 OID 45852)
-- Name: cities; Type: TABLE; Schema: geo; Owner: postgres
--

CREATE TABLE geo.cities (
    city_id integer NOT NULL,
    city_name character varying(100),
    country_id integer,
    population integer
);


ALTER TABLE geo.cities OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 45847)
-- Name: countries; Type: TABLE; Schema: geo; Owner: postgres
--

CREATE TABLE geo.countries (
    country_id integer NOT NULL,
    country_name character varying(100),
    region character varying(100)
);


ALTER TABLE geo.countries OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 45862)
-- Name: departments; Type: TABLE; Schema: hr; Owner: postgres
--

CREATE TABLE hr.departments (
    dept_id integer NOT NULL,
    dept_name character varying(100)
);


ALTER TABLE hr.departments OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 45867)
-- Name: employees; Type: TABLE; Schema: hr; Owner: postgres
--

CREATE TABLE hr.employees (
    emp_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(100),
    hire_date date,
    dept_id integer,
    job_title character varying(100),
    salary integer
);


ALTER TABLE hr.employees OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 45919)
-- Name: stock_movements; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.stock_movements (
    movement_id integer NOT NULL,
    product_id integer,
    warehouse_id integer,
    movement_type character varying(10),
    quantity integer,
    movement_date date
);


ALTER TABLE inventory.stock_movements OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 45914)
-- Name: warehouses; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.warehouses (
    warehouse_id integer NOT NULL,
    warehouse_name character varying(100),
    city character varying(100),
    country character varying(100),
    capacity integer
);


ALTER TABLE inventory.warehouses OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 45877)
-- Name: customers; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.customers (
    customer_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    gender character varying(10),
    email character varying(100),
    phone character varying(20),
    city character varying(100),
    country character varying(100),
    signup_date date
);


ALTER TABLE raw.customers OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 46032)
-- Name: marketing_campaigns; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.marketing_campaigns (
    campaign_id integer NOT NULL,
    campaign_name character varying(150),
    start_date date,
    end_date date,
    budget numeric,
    target_audience character varying(200),
    product_id integer
);


ALTER TABLE raw.marketing_campaigns OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 45899)
-- Name: order_items; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    subtotal integer
);


ALTER TABLE raw.order_items OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 45889)
-- Name: orders; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date,
    total_amount integer,
    payment_id integer,
    status character varying(20)
);


ALTER TABLE raw.orders OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 46044)
-- Name: payments; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.payments (
    payment_id integer NOT NULL,
    payment_method character varying(50),
    payment_date date,
    amount numeric,
    currency character varying(10)
);


ALTER TABLE raw.payments OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 45884)
-- Name: products; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.products (
    product_id integer NOT NULL,
    product_name character varying(100),
    category character varying(100),
    price integer,
    stock integer,
    supplier_id integer
);


ALTER TABLE raw.products OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 46051)
-- Name: shipments; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.shipments (
    shipment_id integer NOT NULL,
    order_id integer,
    courier_name character varying(100),
    shipped_date date,
    delivery_date date,
    status character varying(50)
);


ALTER TABLE raw.shipments OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 46061)
-- Name: suppliers; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(150),
    contact_person character varying(100),
    contact_email character varying(150),
    country character varying(100)
);


ALTER TABLE raw.suppliers OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 46068)
-- Name: support_tickets; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.support_tickets (
    ticket_id integer NOT NULL,
    customer_id integer,
    issue_type character varying(100),
    status character varying(50),
    created_at timestamp without time zone,
    resolved_at timestamp without time zone
);


ALTER TABLE raw.support_tickets OWNER TO postgres;

--
-- TOC entry 5163 (class 0 OID 45852)
-- Dependencies: 260
-- Data for Name: cities; Type: TABLE DATA; Schema: geo; Owner: postgres
--

INSERT INTO geo.cities VALUES (1, 'Mumbai', 1, 20000000);
INSERT INTO geo.cities VALUES (2, 'New York', 2, 9000000);
INSERT INTO geo.cities VALUES (3, 'Berlin', 3, -200000);
INSERT INTO geo.cities VALUES (4, 'Tokyo', 5, 13000000);
INSERT INTO geo.cities VALUES (5, NULL, 1, 1200000);
INSERT INTO geo.cities VALUES (501, 'Guwahati', 1, 957352);
INSERT INTO geo.cities VALUES (502, 'Dibrugarh', 1, 138661);
INSERT INTO geo.cities VALUES (503, 'Silchar', 1, 172830);
INSERT INTO geo.cities VALUES (504, 'Delhi', 1, NULL);


--
-- TOC entry 5162 (class 0 OID 45847)
-- Dependencies: 259
-- Data for Name: countries; Type: TABLE DATA; Schema: geo; Owner: postgres
--

INSERT INTO geo.countries VALUES (1, 'India', 'Asia');
INSERT INTO geo.countries VALUES (2, 'USA', 'North America');
INSERT INTO geo.countries VALUES (3, 'Germany', 'Europe');
INSERT INTO geo.countries VALUES (4, NULL, 'Europe');
INSERT INTO geo.countries VALUES (5, 'Japan', 'Asia');


--
-- TOC entry 5164 (class 0 OID 45862)
-- Dependencies: 261
-- Data for Name: departments; Type: TABLE DATA; Schema: hr; Owner: postgres
--

INSERT INTO hr.departments VALUES (1, 'Engineering');
INSERT INTO hr.departments VALUES (2, 'Marketing');
INSERT INTO hr.departments VALUES (3, 'Sales');
INSERT INTO hr.departments VALUES (4, 'Support');
INSERT INTO hr.departments VALUES (5, NULL);
INSERT INTO hr.departments VALUES (999, 'Unassigned Department');


--
-- TOC entry 5165 (class 0 OID 45867)
-- Dependencies: 262
-- Data for Name: employees; Type: TABLE DATA; Schema: hr; Owner: postgres
--

INSERT INTO hr.employees VALUES (1, 'Rahul', 'Sharma', 'rahul@corp.com', '2021-01-10', 1, 'Engineer', 60000);
INSERT INTO hr.employees VALUES (2, 'Ananya', 'Gupta', NULL, '2022-03-15', 2, 'Marketing Lead', -45000);
INSERT INTO hr.employees VALUES (3, 'John', 'Doe', 'john@corp.com', '2020-06-10', 3, 'Sales Executive', 55000);
INSERT INTO hr.employees VALUES (4, 'Priya', 'Nair', 'priya@corp.com', NULL, NULL, 'HR Assistant', 35000);
INSERT INTO hr.employees VALUES (5, 'Aman', 'Verma', 'aman@corp.com', '2023-04-05', 5, 'Developer', 0);


--
-- TOC entry 5171 (class 0 OID 45919)
-- Dependencies: 268
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

INSERT INTO inventory.stock_movements VALUES (1, 1, 1, 'IN', 15, '2023-11-01');
INSERT INTO inventory.stock_movements VALUES (2, 1, 2, 'OUT', -2, '2023-11-02');
INSERT INTO inventory.stock_movements VALUES (3, 3, 3, 'IN', 50, '2023-11-02');
INSERT INTO inventory.stock_movements VALUES (4, 5, 4, 'OUT', -10, '2023-11-04');
INSERT INTO inventory.stock_movements VALUES (5, 4, 1, 'IN', 25, '2023-11-05');


--
-- TOC entry 5170 (class 0 OID 45914)
-- Dependencies: 267
-- Data for Name: warehouses; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

INSERT INTO inventory.warehouses VALUES (1, 'Mumbai Central', 'Mumbai', 'India', 2000);
INSERT INTO inventory.warehouses VALUES (2, 'NY Storage', 'New York', 'USA', 3500);
INSERT INTO inventory.warehouses VALUES (3, 'Tokyo Hub', 'Tokyo', 'Japan', NULL);
INSERT INTO inventory.warehouses VALUES (4, 'Delhi Depot', 'Delhi', 'India', 1000);


--
-- TOC entry 5166 (class 0 OID 45877)
-- Dependencies: 263
-- Data for Name: customers; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.customers VALUES (1, 'Neha', 'Singh', 'F', 'neha@email.com', '9812345678', 'Mumbai', 'India', '2022-03-10');
INSERT INTO raw.customers VALUES (2, NULL, 'Kumar', 'M', 'ravi@email.com', NULL, 'Delhi', 'India', '2021-07-21');
INSERT INTO raw.customers VALUES (3, 'Robert', 'Miller', 'Male', 'rob.m@email.com', '2128899911', 'New York', 'USA', '2020-08-30');
INSERT INTO raw.customers VALUES (4, 'Aiko', 'Tanaka', 'F', 'aiko@jp.com', NULL, 'Tokyo', 'Japan', '2023-01-01');
INSERT INTO raw.customers VALUES (5, 'Priyanka', NULL, 'Female', 'priya@email.com', '9888899999', NULL, 'India', NULL);


--
-- TOC entry 5172 (class 0 OID 46032)
-- Dependencies: 272
-- Data for Name: marketing_campaigns; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.marketing_campaigns VALUES (1, 'Festive Sale 2023', '2023-10-01', '2023-10-31', 500000, 'All customers - India', 1);
INSERT INTO raw.marketing_campaigns VALUES (2, 'Black Friday Promo', '2023-11-20', '2023-11-27', 350000, 'High-spend customers', 2);
INSERT INTO raw.marketing_campaigns VALUES (3, 'Winter Essentials', '2023-12-01', '2023-12-31', 120000, 'Homeware shoppers', 3);
INSERT INTO raw.marketing_campaigns VALUES (4, 'Apparel Clearance', '2023-09-15', '2023-10-15', 80000, 'Apparel category buyers', 4);
INSERT INTO raw.marketing_campaigns VALUES (5, 'Stationery Bulk Offer', '2023-11-01', '2023-11-30', 20000, 'Schools & colleges', 5);


--
-- TOC entry 5169 (class 0 OID 45899)
-- Dependencies: 266
-- Data for Name: order_items; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.order_items VALUES (1, 1001, 1, 1, 80000);
INSERT INTO raw.order_items VALUES (2, 1001, 2, 1, 2000);
INSERT INTO raw.order_items VALUES (3, 1002, 3, 10, -5000);
INSERT INTO raw.order_items VALUES (4, 1003, 4, 1, 400);
INSERT INTO raw.order_items VALUES (5, 1005, 5, 1200, 12000);


--
-- TOC entry 5168 (class 0 OID 45889)
-- Dependencies: 265
-- Data for Name: orders; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.orders VALUES (1001, 1, '2023-10-10', 82000, 5001, 'Completed');
INSERT INTO raw.orders VALUES (1002, 2, '2023-10-15', -5000, 5002, 'Pending');
INSERT INTO raw.orders VALUES (1003, 3, '2023-11-01', 1500, 5003, NULL);
INSERT INTO raw.orders VALUES (1004, 4, '2023-11-02', 400, NULL, 'Completed');
INSERT INTO raw.orders VALUES (1005, 5, '2023-11-04', 12000, 5005, 'Cancelled');


--
-- TOC entry 5173 (class 0 OID 46044)
-- Dependencies: 273
-- Data for Name: payments; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.payments VALUES (5001, 'Credit Card', '2023-10-10', 82000, 'INR');
INSERT INTO raw.payments VALUES (5002, 'UPI', '2023-10-15', -5000, 'INR');
INSERT INTO raw.payments VALUES (5003, 'PayPal', '2023-11-01', 1500, 'USD');
INSERT INTO raw.payments VALUES (5004, 'Bank Transfer', '2023-11-02', 400, 'INR');
INSERT INTO raw.payments VALUES (5005, 'Netbanking', '2023-11-04', 12000, 'INR');
INSERT INTO raw.payments VALUES (7001, 'Credit Card', '2024-11-01', 2300, 'INR');
INSERT INTO raw.payments VALUES (7002, 'UPI', '2024-11-05', 1150, 'INR');
INSERT INTO raw.payments VALUES (7003, 'Cash', '2024-11-06', 560, 'INR');


--
-- TOC entry 5167 (class 0 OID 45884)
-- Dependencies: 264
-- Data for Name: products; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.products VALUES (1, 'Laptop', 'Electronics', 80000, 15, 1);
INSERT INTO raw.products VALUES (2, 'Headphones', 'Electronics', 2500, NULL, 1);
INSERT INTO raw.products VALUES (3, 'Coffee Mug', 'Homeware', 400, 500, 2);
INSERT INTO raw.products VALUES (4, 'Shirt', 'Apparel', NULL, 300, 3);
INSERT INTO raw.products VALUES (5, 'Pen', 'Stationery', 10, 2000, 2);


--
-- TOC entry 5174 (class 0 OID 46051)
-- Dependencies: 274
-- Data for Name: shipments; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.shipments VALUES (2001, 1001, 'BlueEx Courier', '2023-10-11', '2023-10-14', 'Delivered');
INSERT INTO raw.shipments VALUES (2002, 1002, 'FastShip', '2023-10-16', '2023-10-20', 'In Transit');
INSERT INTO raw.shipments VALUES (2003, 1003, 'QuickDrop', '2023-11-01', NULL, 'Shipped');
INSERT INTO raw.shipments VALUES (2004, 1004, 'BlueEx Courier', '2023-11-03', '2023-11-05', 'Delivered');
INSERT INTO raw.shipments VALUES (2005, 1005, 'LocalExpress', NULL, NULL, 'Pending');


--
-- TOC entry 5175 (class 0 OID 46061)
-- Dependencies: 275
-- Data for Name: suppliers; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.suppliers VALUES (1, 'ElectroGoods Pvt Ltd', 'Mr. Ramesh Iyer', 'ramesh@electrogoods.com', 'India');
INSERT INTO raw.suppliers VALUES (2, 'Homeware Supplies Co', 'Ms. Lina Kapoor', 'lina@homewareco.com', 'India');
INSERT INTO raw.suppliers VALUES (3, 'Apparel Makers Ltd', 'Mr. Mark Johnson', 'mark@apparel.com', 'USA');
INSERT INTO raw.suppliers VALUES (4, 'Stationery World', 'Ms. S. Rao', 'sales@stationeryworld.com', 'India');
INSERT INTO raw.suppliers VALUES (5, 'AudioWorks', 'Mr. Ken Tan', 'ken@audioworks.jp', 'Japan');


--
-- TOC entry 5176 (class 0 OID 46068)
-- Dependencies: 276
-- Data for Name: support_tickets; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.support_tickets VALUES (9001, 1, 'Payment failure', 'Resolved', '2023-10-11 09:15:00', '2023-10-11 12:00:00');
INSERT INTO raw.support_tickets VALUES (9002, 2, 'Missing phone number', 'Open', '2023-10-16 10:00:00', NULL);
INSERT INTO raw.support_tickets VALUES (9003, 3, 'Wrong address', 'Resolved', '2023-11-02 14:30:00', '2023-11-03 11:00:00');
INSERT INTO raw.support_tickets VALUES (9004, 4, 'Delayed delivery', 'Investigating', '2023-11-05 08:00:00', NULL);
INSERT INTO raw.support_tickets VALUES (9005, 5, 'Product quality', 'Closed', '2023-11-06 16:45:00', '2023-11-08 10:00:00');


--
-- TOC entry 4965 (class 2606 OID 45856)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- TOC entry 4963 (class 2606 OID 45851)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- TOC entry 4967 (class 2606 OID 45866)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- TOC entry 4969 (class 2606 OID 45871)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 4981 (class 2606 OID 45923)
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (movement_id);


--
-- TOC entry 4979 (class 2606 OID 45918)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (warehouse_id);


--
-- TOC entry 4971 (class 2606 OID 45883)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4983 (class 2606 OID 46038)
-- Name: marketing_campaigns marketing_campaigns_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.marketing_campaigns
    ADD CONSTRAINT marketing_campaigns_pkey PRIMARY KEY (campaign_id);


--
-- TOC entry 4977 (class 2606 OID 45903)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 4975 (class 2606 OID 45893)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4985 (class 2606 OID 46050)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4973 (class 2606 OID 45888)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4987 (class 2606 OID 46055)
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (shipment_id);


--
-- TOC entry 4989 (class 2606 OID 46067)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 4991 (class 2606 OID 46072)
-- Name: support_tickets support_tickets_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.support_tickets
    ADD CONSTRAINT support_tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 4992 (class 2606 OID 45857)
-- Name: cities cities_country_id_fkey; Type: FK CONSTRAINT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.cities
    ADD CONSTRAINT cities_country_id_fkey FOREIGN KEY (country_id) REFERENCES geo.countries(country_id);


--
-- TOC entry 4993 (class 2606 OID 45872)
-- Name: employees employees_dept_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.employees
    ADD CONSTRAINT employees_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES hr.departments(dept_id);


--
-- TOC entry 4997 (class 2606 OID 45924)
-- Name: stock_movements stock_movements_product_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.stock_movements
    ADD CONSTRAINT stock_movements_product_id_fkey FOREIGN KEY (product_id) REFERENCES raw.products(product_id);


--
-- TOC entry 4998 (class 2606 OID 45929)
-- Name: stock_movements stock_movements_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.stock_movements
    ADD CONSTRAINT stock_movements_warehouse_id_fkey FOREIGN KEY (warehouse_id) REFERENCES inventory.warehouses(warehouse_id);


--
-- TOC entry 4999 (class 2606 OID 46039)
-- Name: marketing_campaigns marketing_campaigns_product_id_fkey; Type: FK CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.marketing_campaigns
    ADD CONSTRAINT marketing_campaigns_product_id_fkey FOREIGN KEY (product_id) REFERENCES raw.products(product_id);


--
-- TOC entry 4995 (class 2606 OID 45904)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES raw.orders(order_id);


--
-- TOC entry 4996 (class 2606 OID 45909)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES raw.products(product_id);


--
-- TOC entry 4994 (class 2606 OID 45894)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES raw.customers(customer_id);


--
-- TOC entry 5000 (class 2606 OID 46056)
-- Name: shipments shipments_order_id_fkey; Type: FK CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.shipments
    ADD CONSTRAINT shipments_order_id_fkey FOREIGN KEY (order_id) REFERENCES raw.orders(order_id);


--
-- TOC entry 5001 (class 2606 OID 46073)
-- Name: support_tickets support_tickets_customer_id_fkey; Type: FK CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.support_tickets
    ADD CONSTRAINT support_tickets_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES raw.customers(customer_id);


-- Completed on 2025-11-11 03:48:28

--
-- PostgreSQL database dump complete
--

