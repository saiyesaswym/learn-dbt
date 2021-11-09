select 
    orderid,
    sum(amount) as total_amount
from {{ ref('stg_payment') }}
group by 1
having not(total_amount>=0)