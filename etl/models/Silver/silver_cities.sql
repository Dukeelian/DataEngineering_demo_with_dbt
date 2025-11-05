{{config(materialized='view')}}

with silver_cities as
(
    select distinct city_id ,
    coalesce(city_name, 'unknown') as city_name,
    country_id,
    case 
        when population < 0 then 0
        when population is null then 0
        else population
    end as population

    from {{ref("cities")}}
   

) 

select * from silver_cities