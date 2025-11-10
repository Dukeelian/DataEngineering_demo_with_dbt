{{config(materialized = "table")}}



with data as (
    select
            product_id,
            product_name,
            category,
            sum(quantity) as quantity_Sold,
            sum(total_amount) as amount,
            round(avg(total_amount),2)as average_amount,
            count(distinct customer_id) as unique_customers

            from {{ref("gold_sales_summary")}}

            group by product_id , product_name, category),

final as (select * , rank() over (partition by category order by amount desc) as rank_in_category from data)

select * from final