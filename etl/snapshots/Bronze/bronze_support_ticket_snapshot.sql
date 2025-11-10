{% snapshot bronze_support_ticket_snapshot %}
{{
   config(
       target_schema='Bronze_snapshots',
       unique_key='ticket_id',

       strategy='check',
       check_cols = ['status',]
   )
}}

select * from {{ ref('support_tickets') }}

{% endsnapshot %}