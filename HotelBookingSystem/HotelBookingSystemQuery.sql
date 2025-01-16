-- create the database
create database hotel_db;
use hotel_db;

create table hotel (
    hotel_id int identity(1,1) not null primary key,
    rating int,
    hotel_name varchar(20) not null unique, 
    loc varchar(50) not null,
    contact_num varchar(15) not null,
    constraint chk_rating check (rating between 1 and 5) 
);


create table staff (
    staff_id int identity(1,1) not null primary key,
    staffName varchar(10) not null,
    position varchar(20) not null,
    contact_num varchar(15),
    hotel_id int,
    foreign key (hotel_id) references hotel(hotel_id)
        on delete cascade
        on update cascade
);


create table guest (
    guest_id int identity(1,1) not null primary key,
    guest_name varchar(10) not null,
    contact varchar(15) not null unique,
    idProofInfo varchar(15) not null 
);


create table room (
    room_id int identity(1,1) not null primary key,
    hotel_id int not null,
    room_num varchar(5) not null unique, 
    room_type varchar(10) not null,
    price decimal(10, 2) not null check (price > 0), 
    room_availability bit default 1, 
    foreign key (hotel_id) references hotel(hotel_id)
        on delete cascade
        on update cascade, 
    constraint chk_room_type check (room_type in ('Single', 'Double', 'Suite'))
);


create table booking (
    booking_id int identity(1,1) not null primary key,
    room_id int not null,
    check_in_out_date date not null,
    booking_date date not null,
    booking_status varchar(10) default 'Pending', 
    total_cost decimal(10, 2) not null check (total_cost > 0), 
    guest_id int not null,
    foreign key (room_id) references room(room_id)
        on delete cascade
        on update cascade,
    foreign key (guest_id) references guest(guest_id)
        on delete cascade
        on update cascade,
    constraint chk_booking_status check (booking_status in ('Pending', 'Confirmed', 'Canceled', 'Check-in', 'Check-out')), 
    constraint chk_check_in_out_date check (check_in_out_date >= booking_date) 
);


create table payment (
    payment_id int identity(1,1) not null primary key,
    payment_date date not null,
    amount decimal(10, 2) not null check (amount > 0), 
    method varchar(10) not null,
    booking_id int not null,
    foreign key (booking_id) references booking(booking_id)
        on delete cascade
        on update cascade
);


create table reviews (
    review_id int identity(1,1) not null primary key,
    guest_id int not null,
    rating int not null check (rating between 1 and 5),
    comment varchar(100) default 'No comments', 
    review_date date not null,
    hotel_id int not null,
    foreign key (hotel_id) references hotel(hotel_id)
        on delete cascade
        on update cascade,
    foreign key (guest_id) references guest(guest_id)
        on delete cascade
        on update cascade 
);
