{{
  config(
    materialized = 'table',
    )
}}


with cust as (
    select customer_id,
    full_name,
    sum(total_amount) as spend
    from {{ref("gold_sales_summary")}}
    group by customer_id, full_name
)


select * , {{classify_customer('c.spend')}} as customer_review from cust as c order by spend desc
