{{config(materialized='view')}}



with silver_marketing_campaigns as
(
    select distinct campaign_id,
    coalesce(campaign_name, 'unknown') as campaign_name,
    coalesce(start_date, '1900-01-01'::date) as start_date,
    coalesce(end_date, '1900-01-01'::date) as end_date,
    case 
        when budget < 0 then 0
        when budget is null then 0
        else budget
    end as budget
    from {{ref("marketing_campaigns")}}
)

select * from silver_marketing_campaigns
