{% macro calculate_revenue_share(value_col, total_col) %}
    round(({{ value_col }} * 100.0 / nullif({{ total_col }}, 0)), 2)
{% endmacro %}