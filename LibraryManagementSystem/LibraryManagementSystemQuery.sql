create database library_db;
use library_db;

create table author (
    author_name varchar(10) primary key,
    author_nationality varchar(20)
);

create table book (
    book_id varchar(10) primary key,
    book_title varchar(50) not null,
    author_name varchar(10), 
    foreign key (author_name) references author(author_name) on delete set null on update cascade
);

create table borrower (
    borrow_id int identity(1,1) primary key,
    member_name varchar(10) not null,
    member_phone varchar(15) not null,
    borrow_date date not null
);

create table transactions  (
    borrow_id int, 
    book_id varchar(10), 
    return_date date not null,
    fine_amount decimal(5, 2) default 0,
    primary key (borrow_id, book_id),
    foreign key (borrow_id) references borrower(borrow_id) on delete cascade on update cascade,
    foreign key (book_id) references book(book_id) on delete cascade on update cascade
);

insert into author (author_name, author_nationality) 
values 
('ramez', 'usa'),
('joel', 'usa'),
('mark', 'uk');


insert into book (book_id, book_title, author_name) 
values 
('b101', 'database systems', 'ramez'),
('b205', 'data science', 'joel'),
('b305', 'python basics', 'mark');


insert into borrower (member_name, member_phone, borrow_date) 
values 
('ali', '9876543210', '2025-01-10'),
('fatima', '9871234560', '2025-01-12');


insert into transactions (borrow_id, book_id, return_date, fine_amount) 
values 
(1, 'b101', '2025-01-20', 0),
(2, 'b205', '2025-01-25', 5),
(1, 'b305', '2025-01-22', 2);

select * from author;

select * from book;

select * from borrower;

select * from transactions;
