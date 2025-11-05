{{config(materialized='view')}}

-- silver_department
with silver_department as
(
    select distinct dept_id,
    coalesce(dept_name, 'unknown') as dept_name
    from {{ref("department")}}
)

select * from silver_department