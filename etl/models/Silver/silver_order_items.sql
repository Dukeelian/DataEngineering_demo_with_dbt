with silver_order_items as
(
    select distinct order_item_id,
    coalesce(order_id, 0) as order_id,
    coalesce(product_id, 0) as product_id,
    case 
        when quantity < 0 then 0
        when quantity is null then 0
        else quantity
    end as quantity,
    case 
        when subtotal < 0 then 0
        when subtotal is null then 0
        else subtotal
    end as subtotal
    from {{ref("order_items")}}
)

select * from silver_order_items