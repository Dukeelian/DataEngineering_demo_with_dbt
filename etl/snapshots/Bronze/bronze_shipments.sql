{% snapshot bronze_shipments_snapshot %}

{{
    config(
        target_schema='Bronze_snapshots',
        unique_key='shipment_id',

        strategy='check',
        check_cols = ['status']
    )
}}

select * from {{ ref('shipments') }}

{% endsnapshot %}   