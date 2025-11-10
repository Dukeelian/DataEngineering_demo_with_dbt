{% macro calculate_growth(current_value, previous_value) %}
    round(
        ({{ current_value }} - {{ previous_value }}) * 100.0 / nullif({{ previous_value }}, 0),
        2
    )
{% endmacro %}