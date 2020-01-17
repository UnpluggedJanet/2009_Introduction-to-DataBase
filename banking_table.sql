create table branch
    (branch_name varchar(15) not null unique,
     branch_city varchar(15) not null,
     assets int not null,
     primary key(branch_name));

create table customer
    (customer_name varchar(15) not null unique,
     customer_steet varchar(15) not null,
     customer_city varchar(15) not null,
     primary key(customer_name));

create table account
    (account_number varchar(15) not null unique,
     branch_name varchar(15) not null,
     balance int not null,
     primary key(account_number));

create table loan
    (loan_number varchar(15) not null unique,
     branch_name varchar(15) not null,
     amount int not null,
     primary key(loan_number));

create table depositor
    (customer_name varchar(15) not null,
     account_number varchar(15) not null,
     primary key(customer_name, account_number),
     foreign key(account_number) references account(account_number),
     foreign key(customer_name) references customer(customer_name));

create table borrower
    (customer_name varchar(15) not null,
     loan_number varchar(15) not null,
     primary key(customer_name, loan_number),
     foreign key(customer_name) references customer(customer_name),
     foreign key(loan_number) references loan(loan_number));