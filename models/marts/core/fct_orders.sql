with orders as(
    select * from {{ ref('stg_orders') }}
),
payments as(
    select * from {{ ref('stg_payment') }}
),
final as(
    select 
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    sum(payments.amount) as total_amount
    from orders
    LEFT JOIN
    payments on orders.order_id = payments.orderid
    where payments.status='success'
    group by 1,2,3
)

select * from final
