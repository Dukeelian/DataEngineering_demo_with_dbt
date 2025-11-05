with silver_warehouses as
(
    select distinct warehouse_id,
    coalesce(warehouse_name, 'unknown') as warehouse_name,
    coalesce(city, 'unknown') as city,
    coalesce(country, 'unknown') as country
    from {{ref("warehouses")}}
)

select * from silver_warehouses