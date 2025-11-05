
{{config(materialized='view')}}

with silver_payments as (
    select distinct payment_id,
    coalesce(payment_date, '1900-01-01'::date) as payment_date,
    case
        when payment_method not in ('credit_card', 'debit_card', 'paypal', 'bank_transfer', 'UPI', 'Net Banking') then 'unknown'
        when payment_method is null then 'unknown'
        else payment_method
    end as payment_method,
    case 
        when amount < 0 then 0
        when amount is null then 0
        else amount
    end as amount,
    case
        when currency not in ('USD', 'EUR', 'GBP', 'INR', 'AUD', 'CAD') then 'unknown'
        when currency is null then 'unknown'
        else currency
    end as currency

    from {{ref("payments")}}
)

select * from silver_payments  