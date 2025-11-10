--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-11-11 03:45:22

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
-- TOC entry 8 (class 2615 OID 44496)
-- Name: geo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA geo;


ALTER SCHEMA geo OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 44476)
-- Name: hr; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA hr;


ALTER SCHEMA hr OWNER TO postgres;

--
-- TOC entry 9 (class 2615 OID 44516)
-- Name: inventory; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA inventory;


ALTER SCHEMA inventory OWNER TO postgres;

--
-- TOC entry 6 (class 2615 OID 44412)
-- Name: raw; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA raw;


ALTER SCHEMA raw OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 281 (class 1259 OID 44505)
-- Name: cities; Type: TABLE; Schema: geo; Owner: postgres
--

CREATE TABLE geo.cities (
    city_id integer NOT NULL,
    city_name character varying(50),
    country_id integer,
    population integer
);


ALTER TABLE geo.cities OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 44504)
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: geo; Owner: postgres
--

CREATE SEQUENCE geo.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE geo.cities_city_id_seq OWNER TO postgres;

--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 280
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: geo; Owner: postgres
--

ALTER SEQUENCE geo.cities_city_id_seq OWNED BY geo.cities.city_id;


--
-- TOC entry 279 (class 1259 OID 44498)
-- Name: countries; Type: TABLE; Schema: geo; Owner: postgres
--

CREATE TABLE geo.countries (
    country_id integer NOT NULL,
    country_name character varying(50),
    region character varying(50)
);


ALTER TABLE geo.countries OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 44497)
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: geo; Owner: postgres
--

CREATE SEQUENCE geo.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE geo.countries_country_id_seq OWNER TO postgres;

--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 278
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: geo; Owner: postgres
--

ALTER SEQUENCE geo.countries_country_id_seq OWNED BY geo.countries.country_id;


--
-- TOC entry 275 (class 1259 OID 44478)
-- Name: departments; Type: TABLE; Schema: hr; Owner: postgres
--

CREATE TABLE hr.departments (
    dept_id integer NOT NULL,
    dept_name character varying(50)
);


ALTER TABLE hr.departments OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 44477)
-- Name: departments_dept_id_seq; Type: SEQUENCE; Schema: hr; Owner: postgres
--

CREATE SEQUENCE hr.departments_dept_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE hr.departments_dept_id_seq OWNER TO postgres;

--
-- TOC entry 5218 (class 0 OID 0)
-- Dependencies: 274
-- Name: departments_dept_id_seq; Type: SEQUENCE OWNED BY; Schema: hr; Owner: postgres
--

ALTER SEQUENCE hr.departments_dept_id_seq OWNED BY hr.departments.dept_id;


--
-- TOC entry 277 (class 1259 OID 44485)
-- Name: employees; Type: TABLE; Schema: hr; Owner: postgres
--

CREATE TABLE hr.employees (
    emp_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    hire_date date,
    dept_id integer,
    job_title character varying(50),
    salary numeric(10,2)
);


ALTER TABLE hr.employees OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 44484)
-- Name: employees_emp_id_seq; Type: SEQUENCE; Schema: hr; Owner: postgres
--

CREATE SEQUENCE hr.employees_emp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE hr.employees_emp_id_seq OWNER TO postgres;

--
-- TOC entry 5219 (class 0 OID 0)
-- Dependencies: 276
-- Name: employees_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: hr; Owner: postgres
--

ALTER SEQUENCE hr.employees_emp_id_seq OWNED BY hr.employees.emp_id;


--
-- TOC entry 285 (class 1259 OID 44525)
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
-- TOC entry 284 (class 1259 OID 44524)
-- Name: stock_movements_movement_id_seq; Type: SEQUENCE; Schema: inventory; Owner: postgres
--

CREATE SEQUENCE inventory.stock_movements_movement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE inventory.stock_movements_movement_id_seq OWNER TO postgres;

--
-- TOC entry 5220 (class 0 OID 0)
-- Dependencies: 284
-- Name: stock_movements_movement_id_seq; Type: SEQUENCE OWNED BY; Schema: inventory; Owner: postgres
--

ALTER SEQUENCE inventory.stock_movements_movement_id_seq OWNED BY inventory.stock_movements.movement_id;


--
-- TOC entry 283 (class 1259 OID 44518)
-- Name: warehouses; Type: TABLE; Schema: inventory; Owner: postgres
--

CREATE TABLE inventory.warehouses (
    warehouse_id integer NOT NULL,
    warehouse_name character varying(100),
    city character varying(50),
    country character varying(50)
);


ALTER TABLE inventory.warehouses OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 44517)
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE; Schema: inventory; Owner: postgres
--

CREATE SEQUENCE inventory.warehouses_warehouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE inventory.warehouses_warehouse_id_seq OWNER TO postgres;

--
-- TOC entry 5221 (class 0 OID 0)
-- Dependencies: 282
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE OWNED BY; Schema: inventory; Owner: postgres
--

ALTER SEQUENCE inventory.warehouses_warehouse_id_seq OWNED BY inventory.warehouses.warehouse_id;


--
-- TOC entry 257 (class 1259 OID 44414)
-- Name: customers; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.customers (
    customer_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    gender character varying(10),
    email character varying(100),
    phone character varying(15),
    city character varying(50),
    country character varying(50),
    signup_date date
);


ALTER TABLE raw.customers OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 44413)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 5222 (class 0 OID 0)
-- Dependencies: 256
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.customers_customer_id_seq OWNED BY raw.customers.customer_id;


--
-- TOC entry 269 (class 1259 OID 44456)
-- Name: marketing_campaigns; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.marketing_campaigns (
    campaign_id integer NOT NULL,
    campaign_name character varying(100),
    start_date date,
    end_date date,
    channel character varying(50),
    budget numeric(10,2)
);


ALTER TABLE raw.marketing_campaigns OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 44455)
-- Name: marketing_campaigns_campaign_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.marketing_campaigns_campaign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.marketing_campaigns_campaign_id_seq OWNER TO postgres;

--
-- TOC entry 5223 (class 0 OID 0)
-- Dependencies: 268
-- Name: marketing_campaigns_campaign_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.marketing_campaigns_campaign_id_seq OWNED BY raw.marketing_campaigns.campaign_id;


--
-- TOC entry 265 (class 1259 OID 44442)
-- Name: order_items; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    subtotal numeric(10,2)
);


ALTER TABLE raw.order_items OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 44441)
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.order_items_order_item_id_seq OWNER TO postgres;

--
-- TOC entry 5224 (class 0 OID 0)
-- Dependencies: 264
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.order_items_order_item_id_seq OWNED BY raw.order_items.order_item_id;


--
-- TOC entry 263 (class 1259 OID 44435)
-- Name: orders; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date,
    total_amount numeric(10,2),
    payment_id integer,
    status character varying(20)
);


ALTER TABLE raw.orders OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 44434)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 5225 (class 0 OID 0)
-- Dependencies: 262
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.orders_order_id_seq OWNED BY raw.orders.order_id;


--
-- TOC entry 267 (class 1259 OID 44449)
-- Name: payments; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.payments (
    payment_id integer NOT NULL,
    payment_date date,
    payment_method character varying(20),
    amount numeric(10,2),
    currency character varying(10)
);


ALTER TABLE raw.payments OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 44448)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 5226 (class 0 OID 0)
-- Dependencies: 266
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.payments_payment_id_seq OWNED BY raw.payments.payment_id;


--
-- TOC entry 259 (class 1259 OID 44421)
-- Name: products; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.products (
    product_id integer NOT NULL,
    product_name character varying(100),
    category character varying(50),
    price numeric(10,2),
    stock integer,
    supplier_id integer
);


ALTER TABLE raw.products OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 44420)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 5227 (class 0 OID 0)
-- Dependencies: 258
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.products_product_id_seq OWNED BY raw.products.product_id;


--
-- TOC entry 273 (class 1259 OID 44470)
-- Name: shipments; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.shipments (
    shipment_id integer NOT NULL,
    order_id integer,
    courier_name character varying(50),
    shipped_date date,
    delivery_date date,
    status character varying(20)
);


ALTER TABLE raw.shipments OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 44469)
-- Name: shipments_shipment_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.shipments_shipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.shipments_shipment_id_seq OWNER TO postgres;

--
-- TOC entry 5228 (class 0 OID 0)
-- Dependencies: 272
-- Name: shipments_shipment_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.shipments_shipment_id_seq OWNED BY raw.shipments.shipment_id;


--
-- TOC entry 261 (class 1259 OID 44428)
-- Name: suppliers; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.suppliers (
    supplier_id integer NOT NULL,
    supplier_name character varying(100),
    contact_person character varying(50),
    contact_email character varying(100),
    country character varying(50)
);


ALTER TABLE raw.suppliers OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 44427)
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.suppliers_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.suppliers_supplier_id_seq OWNER TO postgres;

--
-- TOC entry 5229 (class 0 OID 0)
-- Dependencies: 260
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.suppliers_supplier_id_seq OWNED BY raw.suppliers.supplier_id;


--
-- TOC entry 271 (class 1259 OID 44463)
-- Name: support_tickets; Type: TABLE; Schema: raw; Owner: postgres
--

CREATE TABLE raw.support_tickets (
    ticket_id integer NOT NULL,
    customer_id integer,
    issue_type character varying(50),
    status character varying(20),
    created_at timestamp without time zone,
    resolved_at timestamp without time zone
);


ALTER TABLE raw.support_tickets OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 44462)
-- Name: support_tickets_ticket_id_seq; Type: SEQUENCE; Schema: raw; Owner: postgres
--

CREATE SEQUENCE raw.support_tickets_ticket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE raw.support_tickets_ticket_id_seq OWNER TO postgres;

--
-- TOC entry 5230 (class 0 OID 0)
-- Dependencies: 270
-- Name: support_tickets_ticket_id_seq; Type: SEQUENCE OWNED BY; Schema: raw; Owner: postgres
--

ALTER SEQUENCE raw.support_tickets_ticket_id_seq OWNED BY raw.support_tickets.ticket_id;


--
-- TOC entry 4986 (class 2604 OID 44508)
-- Name: cities city_id; Type: DEFAULT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.cities ALTER COLUMN city_id SET DEFAULT nextval('geo.cities_city_id_seq'::regclass);


--
-- TOC entry 4985 (class 2604 OID 44501)
-- Name: countries country_id; Type: DEFAULT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.countries ALTER COLUMN country_id SET DEFAULT nextval('geo.countries_country_id_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 44481)
-- Name: departments dept_id; Type: DEFAULT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.departments ALTER COLUMN dept_id SET DEFAULT nextval('hr.departments_dept_id_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 44488)
-- Name: employees emp_id; Type: DEFAULT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.employees ALTER COLUMN emp_id SET DEFAULT nextval('hr.employees_emp_id_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 44528)
-- Name: stock_movements movement_id; Type: DEFAULT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.stock_movements ALTER COLUMN movement_id SET DEFAULT nextval('inventory.stock_movements_movement_id_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 44521)
-- Name: warehouses warehouse_id; Type: DEFAULT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouses ALTER COLUMN warehouse_id SET DEFAULT nextval('inventory.warehouses_warehouse_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 44417)
-- Name: customers customer_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.customers ALTER COLUMN customer_id SET DEFAULT nextval('raw.customers_customer_id_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 44459)
-- Name: marketing_campaigns campaign_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.marketing_campaigns ALTER COLUMN campaign_id SET DEFAULT nextval('raw.marketing_campaigns_campaign_id_seq'::regclass);


--
-- TOC entry 4978 (class 2604 OID 44445)
-- Name: order_items order_item_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('raw.order_items_order_item_id_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 44438)
-- Name: orders order_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.orders ALTER COLUMN order_id SET DEFAULT nextval('raw.orders_order_id_seq'::regclass);


--
-- TOC entry 4979 (class 2604 OID 44452)
-- Name: payments payment_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.payments ALTER COLUMN payment_id SET DEFAULT nextval('raw.payments_payment_id_seq'::regclass);


--
-- TOC entry 4975 (class 2604 OID 44424)
-- Name: products product_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.products ALTER COLUMN product_id SET DEFAULT nextval('raw.products_product_id_seq'::regclass);


--
-- TOC entry 4982 (class 2604 OID 44473)
-- Name: shipments shipment_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.shipments ALTER COLUMN shipment_id SET DEFAULT nextval('raw.shipments_shipment_id_seq'::regclass);


--
-- TOC entry 4976 (class 2604 OID 44431)
-- Name: suppliers supplier_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.suppliers ALTER COLUMN supplier_id SET DEFAULT nextval('raw.suppliers_supplier_id_seq'::regclass);


--
-- TOC entry 4981 (class 2604 OID 44466)
-- Name: support_tickets ticket_id; Type: DEFAULT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.support_tickets ALTER COLUMN ticket_id SET DEFAULT nextval('raw.support_tickets_ticket_id_seq'::regclass);


--
-- TOC entry 5206 (class 0 OID 44505)
-- Dependencies: 281
-- Data for Name: cities; Type: TABLE DATA; Schema: geo; Owner: postgres
--

INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (1, 'Mumbai', 1, 20411000);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (2, 'Delhi', 1, 16787941);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (3, 'Kolkata', 1, 14617882);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (4, 'Ahmedabad', 1, 5570585);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (5, 'New York', 2, 8419600);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (6, 'Toronto', 4, 2930000);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (7, 'London', 3, 8982000);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (8, 'Pune', 1, 6647680);
INSERT INTO geo.cities (city_id, city_name, country_id, population) VALUES (9, 'Bangalore', 1, 8443675);


--
-- TOC entry 5204 (class 0 OID 44498)
-- Dependencies: 279
-- Data for Name: countries; Type: TABLE DATA; Schema: geo; Owner: postgres
--

INSERT INTO geo.countries (country_id, country_name, region) VALUES (1, 'India', 'Asia');
INSERT INTO geo.countries (country_id, country_name, region) VALUES (2, 'USA', 'North America');
INSERT INTO geo.countries (country_id, country_name, region) VALUES (3, 'UK', 'Europe');
INSERT INTO geo.countries (country_id, country_name, region) VALUES (4, 'Canada', 'North America');


--
-- TOC entry 5200 (class 0 OID 44478)
-- Dependencies: 275
-- Data for Name: departments; Type: TABLE DATA; Schema: hr; Owner: postgres
--

INSERT INTO hr.departments (dept_id, dept_name) VALUES (1, 'Sales');
INSERT INTO hr.departments (dept_id, dept_name) VALUES (2, 'Finance');
INSERT INTO hr.departments (dept_id, dept_name) VALUES (3, 'Support');
INSERT INTO hr.departments (dept_id, dept_name) VALUES (4, 'Marketing');
INSERT INTO hr.departments (dept_id, dept_name) VALUES (5, 'Logistics');
INSERT INTO hr.departments (dept_id, dept_name) VALUES (6, 'IT');
INSERT INTO hr.departments (dept_id, dept_name) VALUES (7, 'HR');


--
-- TOC entry 5202 (class 0 OID 44485)
-- Dependencies: 277
-- Data for Name: employees; Type: TABLE DATA; Schema: hr; Owner: postgres
--

INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (1, 'Rohan', 'Singh', 'rohan.singh@company.com', '2023-01-10', 1, 'Sales Executive', 45000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (2, 'Anjali', 'Verma', 'anjali.verma@company.com', '2022-05-18', 1, 'Sales Manager', 70000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (3, 'Vikram', 'Patel', 'vikram.patel@company.com', '2021-11-20', 2, 'Accountant', 55000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (4, 'Sneha', 'Rao', 'sneha.rao@company.com', '2023-03-15', 3, 'Support Engineer', 40000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (5, 'Rakesh', 'Mehta', 'rakesh.mehta@company.com', '2022-07-01', 4, 'Marketing Lead', 65000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (6, 'Neha', 'Gupta', 'neha.gupta@company.com', '2021-12-10', 5, 'Logistics Manager', 60000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (7, 'Amit', 'Chopra', 'amit.chopra@company.com', '2024-01-05', 6, 'Software Engineer', 80000.00);
INSERT INTO hr.employees (emp_id, first_name, last_name, email, hire_date, dept_id, job_title, salary) VALUES (8, 'Divya', 'Joshi', 'divya.joshi@company.com', '2024-02-17', 7, 'HR Executive', 50000.00);


--
-- TOC entry 5210 (class 0 OID 44525)
-- Dependencies: 285
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (1, 1, 1, 'OUT', 10, '2024-11-01');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (2, 2, 1, 'OUT', 5, '2024-11-02');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (3, 3, 3, 'IN', 15, '2024-11-03');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (4, 4, 2, 'OUT', 20, '2024-11-05');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (5, 5, 1, 'IN', 10, '2024-11-06');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (6, 6, 4, 'IN', 25, '2024-11-07');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (7, 7, 3, 'OUT', 10, '2024-11-08');
INSERT INTO inventory.stock_movements (movement_id, product_id, warehouse_id, movement_type, quantity, movement_date) VALUES (8, 8, 4, 'OUT', 5, '2024-11-09');


--
-- TOC entry 5208 (class 0 OID 44518)
-- Dependencies: 283
-- Data for Name: warehouses; Type: TABLE DATA; Schema: inventory; Owner: postgres
--

INSERT INTO inventory.warehouses (warehouse_id, warehouse_name, city, country) VALUES (1, 'Main Warehouse Mumbai', 'Mumbai', 'India');
INSERT INTO inventory.warehouses (warehouse_id, warehouse_name, city, country) VALUES (2, 'East Warehouse Kolkata', 'Kolkata', 'India');
INSERT INTO inventory.warehouses (warehouse_id, warehouse_name, city, country) VALUES (3, 'West Warehouse Delhi', 'Delhi', 'India');
INSERT INTO inventory.warehouses (warehouse_id, warehouse_name, city, country) VALUES (4, 'North Warehouse Toronto', 'Toronto', 'Canada');


--
-- TOC entry 5182 (class 0 OID 44414)
-- Dependencies: 257
-- Data for Name: customers; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (1, 'Amit', 'Sharma', 'Male', 'amit.sharma@example.com', '9998887776', 'Mumbai', 'India', '2024-01-15');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (2, 'Priya', 'Das', 'Female', 'priya.das@example.com', '8887776665', 'Kolkata', 'India', '2024-02-20');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (3, 'John', 'Doe', 'Male', 'john.doe@example.com', '7776665554', 'New York', 'USA', '2023-11-05');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (4, 'Sara', 'Khan', 'Female', 'sara.khan@example.com', '9995554443', 'Delhi', 'India', '2024-03-10');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (5, 'Rahul', 'Patel', 'Male', 'rahul.patel@example.com', '8884443332', 'Ahmedabad', 'India', '2024-04-25');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (6, 'Emily', 'Brown', 'Female', 'emily.brown@example.com', '6665554442', 'London', 'UK', '2024-05-12');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (7, 'David', 'Singh', 'Male', 'david.singh@example.com', '5554443331', 'Toronto', 'Canada', '2024-06-18');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (8, 'Riya', 'Sen', 'Female', 'riya.sen@example.com', '9993332221', 'Pune', 'India', '2024-07-04');
INSERT INTO raw.customers (customer_id, first_name, last_name, gender, email, phone, city, country, signup_date) VALUES (9, 'Mohit', 'Verma', 'Male', 'mohit.verma@example.com', '8889991112', 'Bangalore', 'India', '2024-07-22');


--
-- TOC entry 5194 (class 0 OID 44456)
-- Dependencies: 269
-- Data for Name: marketing_campaigns; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.marketing_campaigns (campaign_id, campaign_name, start_date, end_date, channel, budget) VALUES (1, 'Diwali Blast Sale', '2024-10-25', '2024-11-05', 'Email', 50000.00);
INSERT INTO raw.marketing_campaigns (campaign_id, campaign_name, start_date, end_date, channel, budget) VALUES (2, 'New Year Bonanza', '2024-12-25', '2025-01-05', 'Social Media', 80000.00);
INSERT INTO raw.marketing_campaigns (campaign_id, campaign_name, start_date, end_date, channel, budget) VALUES (3, 'Summer Offers', '2024-04-01', '2024-04-30', 'Google Ads', 40000.00);
INSERT INTO raw.marketing_campaigns (campaign_id, campaign_name, start_date, end_date, channel, budget) VALUES (4, 'Winter Warmth', '2024-01-05', '2024-01-20', 'TV Ads', 150000.00);


--
-- TOC entry 5190 (class 0 OID 44442)
-- Dependencies: 265
-- Data for Name: order_items; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (1, 1, 1, 1, 35000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (2, 1, 2, 1, 2500.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (3, 2, 3, 1, 78000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (4, 2, 2, 1, 2500.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (5, 3, 2, 1, 2500.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (6, 4, 5, 1, 15000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (7, 5, 4, 1, 8000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (8, 6, 3, 1, 78000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (9, 6, 6, 1, 900.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (10, 7, 8, 1, 60000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (11, 7, 6, 1, 900.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (12, 8, 4, 1, 8000.00);
INSERT INTO raw.order_items (order_item_id, order_id, product_id, quantity, subtotal) VALUES (13, 9, 1, 1, 35000.00);


--
-- TOC entry 5188 (class 0 OID 44435)
-- Dependencies: 263
-- Data for Name: orders; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (1, 1, '2024-11-01', 37500.00, 1, 'Completed');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (2, 2, '2024-11-03', 80500.00, 2, 'Completed');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (3, 3, '2024-11-05', 2500.00, 3, 'Cancelled');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (4, 4, '2024-11-07', 15000.00, 4, 'Completed');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (5, 5, '2024-11-10', 8000.00, 5, 'Pending');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (6, 6, '2024-11-15', 88000.00, 6, 'Completed');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (7, 7, '2024-11-20', 60900.00, 7, 'Completed');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (8, 8, '2024-11-22', 12000.00, 8, 'Pending');
INSERT INTO raw.orders (order_id, customer_id, order_date, total_amount, payment_id, status) VALUES (9, 9, '2024-11-25', 25000.00, 9, 'Completed');


--
-- TOC entry 5192 (class 0 OID 44449)
-- Dependencies: 267
-- Data for Name: payments; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (1, '2024-11-01', 'Credit Card', 37500.00, 'INR');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (2, '2024-11-03', 'UPI', 80500.00, 'INR');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (3, '2024-11-05', 'Credit Card', 2500.00, 'USD');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (4, '2024-11-07', 'Net Banking', 15000.00, 'INR');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (5, '2024-11-10', 'Cash', 8000.00, 'INR');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (6, '2024-11-15', 'Credit Card', 88000.00, 'GBP');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (7, '2024-11-20', 'UPI', 60900.00, 'INR');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (8, '2024-11-22', 'Debit Card', 12000.00, 'INR');
INSERT INTO raw.payments (payment_id, payment_date, payment_method, amount, currency) VALUES (9, '2024-11-25', 'Credit Card', 25000.00, 'INR');


--
-- TOC entry 5184 (class 0 OID 44421)
-- Dependencies: 259
-- Data for Name: products; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (1, 'Smartphone X', 'Electronics', 35000.00, 50, 1);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (2, 'Bluetooth Headset', 'Accessories', 2500.00, 120, 2);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (3, 'Laptop Pro', 'Electronics', 78000.00, 30, 1);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (4, 'Smartwatch', 'Accessories', 8000.00, 80, 3);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (5, 'Camera Lens', 'Photography', 15000.00, 40, 4);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (6, 'Wireless Mouse', 'Accessories', 900.00, 200, 2);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (7, 'Tablet Air', 'Electronics', 25000.00, 60, 1);
INSERT INTO raw.products (product_id, product_name, category, price, stock, supplier_id) VALUES (8, 'DSLR Camera', 'Photography', 60000.00, 20, 4);


--
-- TOC entry 5198 (class 0 OID 44470)
-- Dependencies: 273
-- Data for Name: shipments; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (1, 1, 'BlueDart', '2024-11-01', '2024-11-03', 'Delivered');
INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (2, 2, 'DTDC', '2024-11-03', '2024-11-06', 'Delivered');
INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (3, 4, 'IndiaPost', '2024-11-07', '2024-11-09', 'Delivered');
INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (4, 5, 'Delhivery', '2024-11-10', NULL, 'In Transit');
INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (5, 6, 'FedEx', '2024-11-15', '2024-11-18', 'Delivered');
INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (6, 7, 'DHL', '2024-11-20', '2024-11-23', 'Delivered');
INSERT INTO raw.shipments (shipment_id, order_id, courier_name, shipped_date, delivery_date, status) VALUES (7, 8, 'BlueDart', '2024-11-22', NULL, 'Pending');


--
-- TOC entry 5186 (class 0 OID 44428)
-- Dependencies: 261
-- Data for Name: suppliers; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.suppliers (supplier_id, supplier_name, contact_person, contact_email, country) VALUES (1, 'TechSource Pvt Ltd', 'Arjun Rao', 'arjun@techsource.in', 'India');
INSERT INTO raw.suppliers (supplier_id, supplier_name, contact_person, contact_email, country) VALUES (2, 'SoundWorld Ltd', 'Emma Parker', 'emma@soundworld.co.uk', 'UK');
INSERT INTO raw.suppliers (supplier_id, supplier_name, contact_person, contact_email, country) VALUES (3, 'GadgetCore Inc', 'David Lee', 'david@gadgetcore.com', 'USA');
INSERT INTO raw.suppliers (supplier_id, supplier_name, contact_person, contact_email, country) VALUES (4, 'LensHub Pvt Ltd', 'Rakesh Gupta', 'rakesh@lenshub.in', 'India');


--
-- TOC entry 5196 (class 0 OID 44463)
-- Dependencies: 271
-- Data for Name: support_tickets; Type: TABLE DATA; Schema: raw; Owner: postgres
--

INSERT INTO raw.support_tickets (ticket_id, customer_id, issue_type, status, created_at, resolved_at) VALUES (1, 1, 'Late Delivery', 'Resolved', '2024-11-02 10:00:00', '2024-11-03 12:30:00');
INSERT INTO raw.support_tickets (ticket_id, customer_id, issue_type, status, created_at, resolved_at) VALUES (2, 2, 'Payment Issue', 'Open', '2024-11-03 14:15:00', NULL);
INSERT INTO raw.support_tickets (ticket_id, customer_id, issue_type, status, created_at, resolved_at) VALUES (3, 4, 'Product Defect', 'Resolved', '2024-11-07 09:30:00', '2024-11-08 15:00:00');
INSERT INTO raw.support_tickets (ticket_id, customer_id, issue_type, status, created_at, resolved_at) VALUES (4, 5, 'Return Request', 'In Progress', '2024-11-10 11:45:00', NULL);
INSERT INTO raw.support_tickets (ticket_id, customer_id, issue_type, status, created_at, resolved_at) VALUES (5, 7, 'Warranty Claim', 'Resolved', '2024-11-20 08:00:00', '2024-11-22 17:20:00');


--
-- TOC entry 5231 (class 0 OID 0)
-- Dependencies: 280
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: geo; Owner: postgres
--

SELECT pg_catalog.setval('geo.cities_city_id_seq', 9, true);


--
-- TOC entry 5232 (class 0 OID 0)
-- Dependencies: 278
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: geo; Owner: postgres
--

SELECT pg_catalog.setval('geo.countries_country_id_seq', 4, true);


--
-- TOC entry 5233 (class 0 OID 0)
-- Dependencies: 274
-- Name: departments_dept_id_seq; Type: SEQUENCE SET; Schema: hr; Owner: postgres
--

SELECT pg_catalog.setval('hr.departments_dept_id_seq', 7, true);


--
-- TOC entry 5234 (class 0 OID 0)
-- Dependencies: 276
-- Name: employees_emp_id_seq; Type: SEQUENCE SET; Schema: hr; Owner: postgres
--

SELECT pg_catalog.setval('hr.employees_emp_id_seq', 8, true);


--
-- TOC entry 5235 (class 0 OID 0)
-- Dependencies: 284
-- Name: stock_movements_movement_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: postgres
--

SELECT pg_catalog.setval('inventory.stock_movements_movement_id_seq', 8, true);


--
-- TOC entry 5236 (class 0 OID 0)
-- Dependencies: 282
-- Name: warehouses_warehouse_id_seq; Type: SEQUENCE SET; Schema: inventory; Owner: postgres
--

SELECT pg_catalog.setval('inventory.warehouses_warehouse_id_seq', 4, true);


--
-- TOC entry 5237 (class 0 OID 0)
-- Dependencies: 256
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.customers_customer_id_seq', 9, true);


--
-- TOC entry 5238 (class 0 OID 0)
-- Dependencies: 268
-- Name: marketing_campaigns_campaign_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.marketing_campaigns_campaign_id_seq', 4, true);


--
-- TOC entry 5239 (class 0 OID 0)
-- Dependencies: 264
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.order_items_order_item_id_seq', 13, true);


--
-- TOC entry 5240 (class 0 OID 0)
-- Dependencies: 262
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.orders_order_id_seq', 9, true);


--
-- TOC entry 5241 (class 0 OID 0)
-- Dependencies: 266
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.payments_payment_id_seq', 9, true);


--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 258
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.products_product_id_seq', 8, true);


--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 272
-- Name: shipments_shipment_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.shipments_shipment_id_seq', 7, true);


--
-- TOC entry 5244 (class 0 OID 0)
-- Dependencies: 260
-- Name: suppliers_supplier_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.suppliers_supplier_id_seq', 4, true);


--
-- TOC entry 5245 (class 0 OID 0)
-- Dependencies: 270
-- Name: support_tickets_ticket_id_seq; Type: SEQUENCE SET; Schema: raw; Owner: postgres
--

SELECT pg_catalog.setval('raw.support_tickets_ticket_id_seq', 5, true);


--
-- TOC entry 5014 (class 2606 OID 44510)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- TOC entry 5012 (class 2606 OID 44503)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- TOC entry 5008 (class 2606 OID 44483)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- TOC entry 5010 (class 2606 OID 44490)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 5018 (class 2606 OID 44530)
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (movement_id);


--
-- TOC entry 5016 (class 2606 OID 44523)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

ALTER TABLE ONLY inventory.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (warehouse_id);


--
-- TOC entry 4990 (class 2606 OID 44419)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 5002 (class 2606 OID 44461)
-- Name: marketing_campaigns marketing_campaigns_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.marketing_campaigns
    ADD CONSTRAINT marketing_campaigns_pkey PRIMARY KEY (campaign_id);


--
-- TOC entry 4998 (class 2606 OID 44447)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 4996 (class 2606 OID 44440)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 5000 (class 2606 OID 44454)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4992 (class 2606 OID 44426)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 5006 (class 2606 OID 44475)
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (shipment_id);


--
-- TOC entry 4994 (class 2606 OID 44433)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);


--
-- TOC entry 5004 (class 2606 OID 44468)
-- Name: support_tickets support_tickets_pkey; Type: CONSTRAINT; Schema: raw; Owner: postgres
--

ALTER TABLE ONLY raw.support_tickets
    ADD CONSTRAINT support_tickets_pkey PRIMARY KEY (ticket_id);


--
-- TOC entry 5020 (class 2606 OID 44511)
-- Name: cities cities_country_id_fkey; Type: FK CONSTRAINT; Schema: geo; Owner: postgres
--

ALTER TABLE ONLY geo.cities
    ADD CONSTRAINT cities_country_id_fkey FOREIGN KEY (country_id) REFERENCES geo.countries(country_id);


--
-- TOC entry 5019 (class 2606 OID 44491)
-- Name: employees employees_dept_id_fkey; Type: FK CONSTRAINT; Schema: hr; Owner: postgres
--

ALTER TABLE ONLY hr.employees
    ADD CONSTRAINT employees_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES hr.departments(dept_id);


-- Completed on 2025-11-11 03:45:22

--
-- PostgreSQL database dump complete
--

