{% macro classify_customer(spend_col) %}
    case
        when {{ spend_col }} >= 25000 then 'High Value Customer'
        when {{ spend_col }} between 10000 and 24999 then 'Medium Value Customer'
        else 'Low Value Customer'
    end
{% endmacro %}
