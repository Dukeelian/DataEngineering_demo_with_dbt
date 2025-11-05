with silver_customers as
(
    select distinct customer_id,
    coalesce(first_name, 'unknown') as first_name,
    coalesce(last_name, 'unknown') as last_name,
    coalesce(gender, 'unknown') as gender,
    coalesce(email, 'unknown') as email,
    coalesce(phone, 'unknown') as phone,
    coalesce(city, 'unknown') as city,
    coalesce(country, 'unknown') as country,
     case 
            when signup_date is null then '1900-01-01'::date
            when signup_date > current_date then current_date
            else signup_date
        end as signup_date
    from {{ref("customers")}}
)

select customer_id, 
concat(first_name, ' ', last_name) as full_name, 
gender,
email,
phone,
city,
country,
signup_date
 from silver_customers