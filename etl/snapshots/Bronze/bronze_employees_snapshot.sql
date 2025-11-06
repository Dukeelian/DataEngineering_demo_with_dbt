{% snapshot bronze_employees_snapshot %}


{{
   config(
       target_database='ETL_dev',
       target_schema='Bronze_snapshots',
       unique_key='emp_id',

       strategy='check',
       check_cols = ['dept_id','job_title','salary']
   )
}}

select * from {{ ref('employees') }}

{% endsnapshot %}