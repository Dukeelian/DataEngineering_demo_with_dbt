{{
  config(
    materialized = 'table'
    )
}}

with summary_sales as (

select 
    o.order_id,
    c.full_name,
    o.customer_id,
    c.gender,
    p.product_name,
    oi.product_id,
    oi.quantity,
    p.category,
    o.order_date,
    o.status,
    o.total_amount
    from {{ref("silver_orders")}} as o 
    join {{ref("silver_customers")}} as c
    on o.customer_id = c.customer_id
    join {{ref("silver_order_items")}} as oi 
    on o.order_id = oi.order_id
    join
    {{ref("silver_products")}} as p
    on p.product_id = oi.product_id)
    

select * from summary_sales order by order_id