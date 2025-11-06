{% snapshot bronze_products_snapshot %}

{{
   config(
       target_database='ETL_dev',
       target_schema='Bronze_snapshots',
       unique_key='product_id',

       strategy='check',
       check_cols = ['product_name','price','category','stock', 'supplier_id']
   )
}}

select * from {{ ref('products') }}

{% endsnapshot %}