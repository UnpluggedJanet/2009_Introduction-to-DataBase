/*대출고객이름*/
select customer_name
from borrower;

/*대출 고객의 이름과 사는 도시*/
select c.customer_name, c.customer_city
from borrower as b, customer as c
where b.customer_name = c.customer_name;

/*Perryridge 지점에서 대출한 고객 이름과 사는 도시*/
select c.customer_name, c.customer_city
from borrower as b, customer as c, loan as l
where b.customer_name = c.customer_name
	and l.loan_number = b.loan_number
	and l.branch_name = 'Perryridge';

/*예금액이 700과 900 사이의 예금 계좌 번호*/
select account_number
from account
where balance between 700 and 900;

/*예금액이 700과 900 사이의 예금 계좌 번호와 고객 이름*/
select a.account_number, d.customer_name
from account as a, depositor as d
where a.account_number = d.account_number
	and balance between 700 and 900;

/*사는곳에 Hill이 들어간 고객 이름과 거리*/
select customer_name, customer_street
from customer
where customer_street like '%Hill'

/*Brooklyn 도시의 지점들의 자산보다 큰 자산을 갖는 지점이름과 자산
       (단순질의, 복합질의 모두)*/
select t.branch_name, t.assets
from branch as t, branch as s
where t.assets > s.assets
	and s.branch_city='Brooklyn'

select branch_name, assets
from branch
where assets>some(select assets
		 from branch
		where branch_city='Brooklyn')
/*Brooklyn 도시의  모든 지점들의 자산보다 큰 자산을 갖는 지점이름과 자산*/

select branch_name, assets
from branch
where assets>all(select assets
		 from branch
		where branch_city='Brooklyn')

/*지점별 평균 예금액*/
select * from account

select branch_name, avg(balance)
from account
group by branch_name
/*지점별 평균 예금액이 700보다 큰 지점*/

select branch_name, avg(balance)
from account
group by branch_name
having avg(balance)>700