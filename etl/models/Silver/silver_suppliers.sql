{{config(
    materialized='view'
)}}



with silver_suppliers as (
    select distinct supplier_id,
    coalesce(supplier_name, 'unknown') as supplier_name,
    coalesce(contact_person, 'unknown') as contact_person,
    coalesce(contact_email, 'unknown') as contact_email,
    coalesce(country, 'unknown') as country
    from {{ref("suppliers")}}
)

select * from silver_suppliers