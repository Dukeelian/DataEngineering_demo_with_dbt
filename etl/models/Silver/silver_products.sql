{{config(materialized='view')}}



with silver_products as (
    select distinct product_id,
    coalesce(product_name, 'unknown') as product_name,
    coalesce(category, 'unknown') as category,
    case 
        when price < 0 then 0
        when price is null then 0
        else price
    end as price,
    case 
        when stock < 0 then 0
        when stock is null then 0

        else stock
    end as stock,
    coalesce(supplier_id, 0) as supplier_id
    from {{ref("bronze_products_snapshot")}} where dbt_valid_to is null
)

select * from silver_products