{{config(materialized='view')}}

with silver_countries as
(
    select distinct country_id,
    coalesce(country_name, 'unknown') as country_name,
    coalesce(region, 'unknown') as region
    from {{ref("countries")}}
    
)


select * from silver_countries