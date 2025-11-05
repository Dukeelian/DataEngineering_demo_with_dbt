
--silver_cities.sql


with silver_cities as
(
    select distinct city_id ,
    coalesce(city_name, 'unknown') as city_name,
    country_id,
    case 
        when population < 0 then 0
        when population is null then 0
        else population
    end as population

    from {{ref("cities")}}

) 

select * from silver_cities;



-- silver_countries
with silver_countries as
(
    select distinct country_id,
    coalesce(country_name, 'unknown') as country_name,
    coalesce(region, 'unknown') as region
    from {{ref("countries")}}
    
)


select * from silver_countries 


-- silver_department
with silver_department as
(
    select distinct dept_id,
    coalesce(dept_name, 'unknown') as dept_name
    from {{ref("department")}}
)

select * from silver_department

-- silver_customers
with silver_customers as
(
    select distinct customer_id,
    coalesce(first_name, 'unknown') as first_name,
    coalesce(last_name, 'unknown') as last_name,
    coalesce(gender, 'unknown') as gender,
    coalesce(email, 'unknown') as email,
    coalesce(phone, 'unknown') as phone,
    coalesce(city, "unknown") as city,
    coalesce(country, "unknown") as country,
     case 
            when signup_date is null then '1900-01-01'::date
            when signup_date > current_date then current_date
            else signup_date
        end as signup_date
    from {{ref("customers")}}
)

select concat(first_name, ' ', last_name) as full_name, * from silver_customers;


--silver_employees
with silver_employees as
(
    select distinct emp_id,
    coalesce(first_name, 'unknown') as first_name,
    coalesce(last_name, 'unknown') as last_name,
    coalesce(email, 'unknown') as email,
    coalesce(hire_date, '1900-01-01'::date) as hire_date,
    coalesce(dept_id, 0) as dept_id,
    coalesce(job_title, 'unknown') as job_title,
    case 
        when salary < 0 then 0
        when salary is null then 0
        else salary
    end as salary
    from {{ref("employees")}}
)

select emp_id ,concat(first_name, ' ', last_name) as full_name, email, hire_date, dept_id, job_title, salary from silver_employees;




--silver_marketing_campaigns





with silver_marketing_campaigns as
(
    select distinct campaign_id,
    coalesce(campaign_name, 'unknown') as campaign_name,
    coalesce(start_date, '1900-01-01'::date) as start_date,
    coalesce(end_date, '1900-01-01'::date) as end_date,
    case 
        when budget < 0 then 0
        when budget is not int then 0
        when budget is null then 0
        else budget
    end as budget
    from {{ref("marketing_campaigns")}}
)

select * from silver_marketing_campaigns;

--silver_order_items

with silver_order_items as
(
    select distinct order_item_id,
    coalesce(order_id, 0) as order_id,
    coalesce(product_id, 0) as product_id,
    case 
        when quantity < 0 then 0
        when quantity is null then 0
        else quantity
    end as quantity,
    case 
        when subtotal < 0 then 0
        when subtotal is null then 0
        else subtotal
    end as subtotal
    from {{ref("order_items")}}
)

select * from silver_order_items;



--silver_orders






select * from {{ref("orders")}}

select * from {{ref("payments")}}

select * from {{ref("products")}}

select * from {{ref("shipments")}}


select * from {{ref("stock_movements")}}

select * from {{ref("suppliers")}}

select * from {{ref("support_tickets")}}

select * from {{ref("warehouses")}}