{{config(materialized='view')}}


with silver_stock_movement as (
    select distinct movement_id,
    coalesce(product_id, 0) as product_id,
    coalesce(warehouse_id, 0) as warehouse_id,
    coalesce(movement_type, 'unknown') as movement_type,
    coalesce(quantity, 0) as quantity,
    coalesce(movement_date, current_date) as movement_date

    from {{ref("stock_movements")}}
)

select * from silver_stock_movement