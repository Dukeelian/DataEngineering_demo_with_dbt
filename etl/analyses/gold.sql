    select customer_id,
    full_name,
    sum(total_amount) as spend
    from {{ref("gold_sales_summary")}}
    group by customer_id, full_name
    order by spend