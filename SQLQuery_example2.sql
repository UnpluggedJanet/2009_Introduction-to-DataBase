/*예금을 했거나 대출을 한 고객*/
select customer_name
from depositor

select customer_name
from borrower

select customer_name
from depositor
union
select customer_name
from borrower
/*예금과 대출을 모두 한 고객*/

/*select customer_name
from depositor
intersect
select customer_name
from borrower*/


/*예금만 하고 대출은 하지 않은 고객*/
/*select customer_name
from depositor
except
select customer_name
from borrower*/