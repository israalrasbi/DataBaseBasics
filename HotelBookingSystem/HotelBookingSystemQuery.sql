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

--insert data into hotel
insert into hotel (rating, hotel_name, loc, contact_num)
values
(5, 'Grand Plaza', 'Downtown City', '555-1234567'),
(4, 'Sea View Resort', 'Coastal Avenue', '555-7654321'),
(3, 'Budget Inn', 'Main Street', '555-1112222');

select * from hotel;

--insert data into staff
insert into staff (staffName, position, contact_num, hotel_id)
values
('Alice', 'Manager', '555-1110000', 1),
('Bob', 'Receptionist', '555-2220000', 2),
('Charlie', 'Cleaner', '555-3330000', 3);

select * from staff;

--insert data into guest
insert into guest (guest_name, contact, idProofInfo)
values
('John', '555-4440000', 'Passport123'),
('Emily', '555-5550000', 'IDCard456'),
('Liam', '555-6660000', 'DriverLic789');

select * from guest;

--insert data into room
insert into room (hotel_id, room_num, room_type, price, room_availability)
values
(1, '101', 'Single', 100.00, 1),
(1, '102', 'Double', 150.00, 1),
(2, '201', 'Suite', 300.00, 1),
(3, '301', 'Single', 90.00, 1);

select * from room;

--insert data into booking
insert into booking (room_id, check_in_out_date, booking_date, booking_status, total_cost, guest_id)
values
(1, '2025-01-20', '2025-01-15', 'Confirmed', 500.00, 1),
(2, '2025-01-22', '2025-01-16', 'Pending', 450.00, 2),
(3, '2025-01-25', '2025-01-18', 'Confirmed', 300.00, 3);

select * from booking;

--insert data into payment
insert into payment (payment_date, amount, method, booking_id)
values
('2025-01-16', 500.00, 'Credit', 1),
('2025-01-17', 450.00, 'Debit', 2),
('2025-01-19', 300.00, 'Cash', 3);

select * from payment;

--insert data into reviews
insert into reviews (guest_id, rating, comment, review_date, hotel_id)
values
(1, 5, 'Excellent service!', '2025-01-21', 1),
(2, 4, 'Nice view, but food was average.', '2025-01-23', 2),
(3, 3, default, '2025-01-26', 3); 

select * from reviews;

