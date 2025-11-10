select c.city
from silver.silver_customers c
left join silver.silver_cities ci

  on lower(trim(c.city)) = lower(trim(ci.city_name))
where ci.city_name is null;
