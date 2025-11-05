{{config(
    materialized='view'
)}}


with silver_support_tickets as (
    select distinct ticket_id,
    coalesce(customer_id, 0) as customer_id,
    coalesce(issue_type, 'unknown') as issue_type,
    coalesce(status, 'unknown') as status,
    coalesce(created_at, current_date :: timestamp) as created_at,
    coalesce(resolved_at, current_date :: timestamp) as resolved_at
    from {{ref("support_tickets")}}
)

select * from silver_support_tickets