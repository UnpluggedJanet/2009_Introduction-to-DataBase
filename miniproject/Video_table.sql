create table ����
	(����_id integer not null unique,
	 �̸� varchar(15) not null,
	 ���� varchar(15) not null,
	 ���� integer not null,
	 ������ varchar(15) not null,
	 �Ի��� integer not null,
	 primary key(����_id))

create table ȸ��
	(ȸ��_id integer not null unique,
	 �̸� varchar(15) not null,
	 �ּ� varchar(15) not null,
	 ��ȭ��ȣ varchar(15) not null,
	 primary key(ȸ��_id))

create table ����
	(����_id varchar(15) not null unique,
	 ���� varchar(15) not null,
	 �帣 varchar(15) not null,
	 ���ѿ��� integer not null,
	 primary key(����_id))

create table ����
	(������ varchar(15) not null unique,
	 �ּ� varchar(15) not null,
	 ��ȭ��ȣ varchar(15) not null,
	 primary key(������))

create table �԰�
	(����_id integer not null,
	 ����_id varchar(15) not null,
	 �԰��� integer not null,
	 �԰��� integer not null,
	 primary key(����_id, ����_id),
	 foreign key(����_id) references ����(����_id),
	 foreign key(����_id) references ����(����_id))

create table ����
	(������ varchar(15) not null,
	 ȸ��_id integer not null,
	 ������ integer not null,
	 primary key(������, ȸ��_id),
	 foreign key(������) references ����(������),
	 foreign key(ȸ��_id) references ȸ��(ȸ��_id))

create table ����
	(������ varchar(15) not null,
	 ����_id varchar(15) not null,
	 �������� integer not null,
	 primary key(������, ����_id),
	 foreign key(������) references ����(������),
	 foreign key(����_id) references ����(����_id))

create table �뿩
	(ȸ��_id integer not null,
	 ����_id varchar(15) not null,
	 �뿩�� integer not null,
	 primary key(ȸ��_id, ����_id),
	 foreign key(ȸ��_id) references ȸ��(ȸ��_id),
	 foreign key(����_id) references ����(����_id))

create table �ݳ�
	(ȸ��_id integer not null,
	 ����_id varchar(15) not null,
	 �ݳ��� integer not null,
	 ��ü�� integer not null,
	 ��ü�� integer not null,
	 primary key(ȸ��_id, ����_id),
	 foreign key(ȸ��_id) references ȸ��(ȸ��_id),
	 foreign key(����_id) references ����(����_id))

