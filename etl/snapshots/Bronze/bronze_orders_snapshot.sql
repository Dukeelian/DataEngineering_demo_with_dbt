{% snapshot bronze_orders_snapshot %}

{{
   config(
       target_database='ETL_dev',
       target_schema='Bronze_snapshots',
       unique_key='order_id',

       strategy='check',
       check_cols = ['status']
   )
}}

select * from {{ ref('orders') }}


{% endsnapshot %}