with payments as (
    select id as paymentid,
    orderid,
    status,
    amount/100 as amount
    FROM {{ source('stripe','payment') }}
)

select * from payments