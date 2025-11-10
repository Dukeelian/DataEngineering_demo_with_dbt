{{ config(materialized='table') }}

with monthly_sales as (
    select 
        date_trunc('month', order_date) as month,
        sum(total_amount) as total_revenue
    from {{ ref("gold_sales_summary") }}
    group by 1
    order by 1
)

select 
    month,
    total_revenue,
    {{ calculate_growth('total_revenue', 'lag(total_revenue) over (order by month)') }} as revenue_growth_pct
from monthly_sales
