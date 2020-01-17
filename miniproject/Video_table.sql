create table 직원
	(직원_id integer not null unique,
	 이름 varchar(15) not null,
	 직급 varchar(15) not null,
	 월급 integer not null,
	 지점명 varchar(15) not null,
	 입사일 integer not null,
	 primary key(직원_id))

create table 회원
	(회원_id integer not null unique,
	 이름 varchar(15) not null,
	 주소 varchar(15) not null,
	 전화번호 varchar(15) not null,
	 primary key(회원_id))

create table 비디오
	(비디오_id varchar(15) not null unique,
	 제목 varchar(15) not null,
	 장르 varchar(15) not null,
	 제한연령 integer not null,
	 primary key(비디오_id))

create table 지점
	(지점명 varchar(15) not null unique,
	 주소 varchar(15) not null,
	 전화번호 varchar(15) not null,
	 primary key(지점명))

create table 입고
	(직원_id integer not null,
	 비디오_id varchar(15) not null,
	 입고일 integer not null,
	 입고개수 integer not null,
	 primary key(직원_id, 비디오_id),
	 foreign key(직원_id) references 직원(직원_id),
	 foreign key(비디오_id) references 비디오(비디오_id))

create table 가입
	(지점명 varchar(15) not null,
	 회원_id integer not null,
	 가입일 integer not null,
	 primary key(지점명, 회원_id),
	 foreign key(지점명) references 지점(지점명),
	 foreign key(회원_id) references 회원(회원_id))

create table 보유
	(지점명 varchar(15) not null,
	 비디오_id varchar(15) not null,
	 보유개수 integer not null,
	 primary key(지점명, 비디오_id),
	 foreign key(지점명) references 지점(지점명),
	 foreign key(비디오_id) references 비디오(비디오_id))

create table 대여
	(회원_id integer not null,
	 비디오_id varchar(15) not null,
	 대여일 integer not null,
	 primary key(회원_id, 비디오_id),
	 foreign key(회원_id) references 회원(회원_id),
	 foreign key(비디오_id) references 비디오(비디오_id))

create table 반납
	(회원_id integer not null,
	 비디오_id varchar(15) not null,
	 반납일 integer not null,
	 연체일 integer not null,
	 연체료 integer not null,
	 primary key(회원_id, 비디오_id),
	 foreign key(회원_id) references 회원(회원_id),
	 foreign key(비디오_id) references 비디오(비디오_id))

