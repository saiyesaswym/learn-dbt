with payments as (
    select id as paymentid,
    orderid,
    status,
    amount/100 as amount
    FROM stripe.payment
)

select * from payments