{{config(materialized='view')}}


with silver_orders as (
    select
        distinct order_id,
        coalesce(customer_id, 0) as customer_id,
        coalesce(order_date, '1900-01-01'::date) as order_date,
       case 
            when total_amount < 0 then 0
            when total_amount is null then 0
            else total_amount
        end as total_amount,
        coalesce(payment_id, 0) as payment_id,
        case 
            when status not in ('pending', 'completed', 'canceled') then 'unknown'
            when status is null then 'unknown'
            else status
        end as status

        from {{ref("orders")}})


select * from silver_orders