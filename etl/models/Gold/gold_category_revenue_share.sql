{{
  config(
    materialized = 'table',
    )
}}

with total_revenue as (
    select sum(total_amount) as revenue from {{ ref('gold_sales_summary') }}
),
revenue_per_catagory as (
    select category ,
    sum(total_amount) as sale_per_category
    from {{ref('gold_sales_summary')}}
    group by category

),

final_category_data as (
select r.category, r.sale_per_category , {{calculate_revenue_share( 'r.sale_per_category ', 't.revenue' )}} as revenue_share_percentage
from revenue_per_catagory as r
cross join
total_revenue as t
)

select * from final_category_data