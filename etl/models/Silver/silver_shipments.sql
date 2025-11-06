{{config(materialized='view')}}

with silver_shipment as (
select distinct shipment_id,
coalesce(order_id, 0) as order_id,
coalesce(courier_name, 'unknown') as courier_name,
coalesce(shipped_date, current_date) as shipment_date,
coalesce(delivery_date, coalesce(shipped_date, current_date)) as delivery_date,
case
    when status not in ('In Transit', 'Delivered', 'Returned') then 'unknown'
    when status is null then 'unknown'
    else status
end as status
from {{ref("bronze_shipments_snapshot")}} where dbt_valid_to is null
)

select * from silver_shipment

