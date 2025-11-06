{{config(materialized='view')}}


with silver_employees as
(
    select distinct emp_id,
    coalesce(first_name, 'unknown') as first_name,
    coalesce(last_name, 'unknown') as last_name,
    coalesce(email, 'unknown') as email,
    coalesce(hire_date, '1900-01-01'::date) as hire_date,
    coalesce(dept_id, 0) as dept_id,
    coalesce(job_title, 'unknown') as job_title,
    case 
        when salary < 0 then 0
        when salary is null then 0
        else salary
    end as salary
    from {{ref("bronze_employees_snapshot")}} where dbt_valid_to is null
)

select emp_id ,concat(first_name, ' ', last_name) as full_name, email, hire_date, dept_id, job_title, salary from silver_employees 