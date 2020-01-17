/*1(일반)'동덕여대점'에 일하는 직원 찾기*/
select 이름
from 직원
where 지점명 = '동덕여대점'

/*2(일반)비디오 제목에 '사랑'이 들어간 비디오 찾기*/
select 제목
from 비디오
where 제목 like '%사랑%'

/*3(일반)비디오중 15세 이상 볼수있는 영화 찾기*/
select 제목
from 비디오
where 제한연령 >= 15

/*4(일반)연체를 3일 이상한 회원과 비디오제목, 연체료 찾기*/
select 이름, 제목, 연체료
from 회원, 비디오, 반납
where 회원.회원_id = 반납.회원_id
	and 비디오.비디오_id = 반납.비디오_id
	and 연체일 >= 3

/*5(복합)*대여는 했지만 반납하지 않은 회원 찾기*/
select distinct 이름
from 대여, 회원
where 대여.회원_id = 회원.회원_id
	and 비디오_id not in (select 비디오_id
			     from 반납)

/*6(복합)대여와 반납이 된 비디오 찾기*/
select 비디오_id
from 대여
where 비디오_id in (select 비디오_id
		 	from 반납)

/*7(복합)12세 영화를 대여했거나 18세 영화를 대여한 회원 찾기*/
select distinct 이름
from 회원, 대여, 비디오
where 회원.회원_id = 대여.회원_id
	and 대여.비디오_id = 비디오.비디오_id
	and 제한연령 = 12
union

select distinct 이름
from 회원, 대여, 비디오
where 회원.회원_id = 대여.회원_id
	and 대여.비디오_id = 비디오.비디오_id
	and 제한연령 = 18
/*8(함수)비디오를 가장 많이 보유한 지점 찾기*/
select 지점명, sum(보유개수) as 보유개수
from 보유
group by 지점명
having sum(보유개수) >= all (select sum(보유개수)
			   from 보유
			   group by 지점명)
/*9(함수)가입한 총 회원 수 구하기*/

select count(회원_id) as 총회원수
from 회원

/*10(함수)직원_id가 003인 직원이 입고한 비디오의 개수 구하기*/
select count(비디오_id) as 비디오개수
from 입고
where 직원_id = 003