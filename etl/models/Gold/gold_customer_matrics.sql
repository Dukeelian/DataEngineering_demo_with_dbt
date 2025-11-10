{{ config(materialized = "table")}}



with total_orders as (
    select customer_id,
            full_name,
            count(distinct order_id ) as number_of_time_order_placed,
            sum(total_amount) as total_amount,
            round(avg(total_amount),2) as avg_value,
            min(order_date) as first_order_date,
            max(order_date) as last_order_date

            from {{ref("gold_sales_summary")}}
            group by customer_id , full_name 
            ),
final_matrix as(
 select * ,  (current_date - last_order_date) as days_since_last_order_placed,
        case 
            when number_of_time_order_placed > 1 then 'New_customer'
            when (current_date - last_order_date) <= 30 then 'Active Customer'
            when (current_date - last_order_date) between 31 and 90 then 'Dormant Customer'
            else 'Churned Customer'
        end as customer_status 

        from total_orders
)

select * from final_matrix order by customer_id