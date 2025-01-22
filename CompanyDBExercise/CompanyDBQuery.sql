create database CompanyDB;
use CompanyDB;

create table departments(
	department_id INT identity(1,1) PRIMARY KEY,
	department_name VARCHAR(50) NOT NULL,
	loc VARCHAR(50) NOT NULL
);

create table employees(
	employee_id INT identity(1,1) PRIMARY KEY,
	emp_name VARCHAR(100) NOT NULL,
	salary DECIMAL(10, 2) NOT NULL,
	department_id INT,
	foreign key ( department_id) references  departments(department_id) on delete cascade on update cascade,
	hire_date DATE NOT NULL
);

create table projects(
	project_id INT identity(1,1) PRIMARY KEY,
	project_name VARCHAR(100) NOT NULL,
	department_id INT,
	foreign key ( department_id) references  departments(department_id) on delete cascade on update cascade,
	budget DECIMAL(10, 2) NOT NULL
);

insert into departments (department_name, loc) values
('HR', 'head office'),
('IT', 'tech park'),
('Finance', 'corporate tower'),
('Marketing', 'regional office');

select * from departments;

insert into employees (emp_name, salary, department_id, hire_date) values
('John Doe', 5000.00, 1, '2024-01-10'),
('Jane Smith', 6000.00, 2, '2024-02-15'),
('Michael Brown', 5500.00, 3, '2024-03-20'),
('Emily Davis', 7000.00, 4, '2024-04-25'),
('William Johnson', 4500.00, null, '2024-05-10'), 
('Olivia Williams', 4800.00, null, '2024-06-18');

select * from employees;

insert into projects (project_name, department_id, budget) values
('Recruitment drive', 1, 15000.00),
('Server upgrade', 2, 20000.00),
('Audit preparation', 3, 18000.00),
('Marketing campaign', 4, 25000.00);

select * from projects;