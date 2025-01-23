use CompanyDB;

--Find all employees earning a salary higher than the average salary of all employees.
select employee_id, emp_name, salary 
from employees
where salary > (select AVG(salary) from employees);

--List the names of employees working in departments located in 'New York'.
select emp_name 
from employees
where department_id IN (select department_id from departments where loc='tech park');

--Find employees whose salaries are greater than the average salary of their respective department.
select employee_id, emp_name, department_id 
from employees
where salary > (select AVG(salary) 
				from employees as average_salary
				where average_salary.department_id = employees.department_id);

--Retrieve the names of employees who are not assigned to any department.
select employee_id,emp_name 
from employees
where department_id is null;

--List the names of departments that do not have any associated projects.
select department_name 
from departments
where not exists (select project_id 
				  from projects 
				  where projects.department_id = departments.department_id);

--Identify the department name with the highest number of employees.
select department_name
from departments
where department_id = ( select top 1 department_id
						from employees
						group by department_id
						order by count(employee_id) desc);


-- List the names and salaries of the highest-paid employees in each department.
select employee_id, emp_name, department_id, salary
from employees
where salary = (select max(salary) 
				from employees as max_salary
				where max_salary.department_id = employees.department_id);

--Find projects whose budgets exceed the total salaries of all employees in their respective departments.
select project_id, project_name
from projects
where budget > (select sum(salary) 
				from employees
				where projects.department_id = employees.department_id);

--Find the names of employees working in departments that manage projects with a budget greater than $200,000.
select emp_name 
from employees
where department_id = (select department_id 
						from projects 
						where budget > 20000);

--List the names of employees who work in departments located in 'San Francisco'.
select emp_name
from employees
where department_id = (select department_id
						from departments
						where loc = 'head office');

--Identify employees who earn more than the average salary across all departments.
select employee_id, emp_name
from employees
where salary > (select AVG(salary) 
				from employees);

--Retrieve the name of the department that manages the project with the highest budget.
select department_name 
from departments
where department_id = (select department_id
						from projects
						where budget = (select max(budget) from projects));

--Display the department ID and the total number of employees in each department.
select department_id, count(employee_id) as total_emp
from employees
group by department_id;

--List employees who are in departments that do not have any projects.
select employee_id, emp_name
from employees
where department_id = (select department_id
					  from departments as d
					  where not exists (select project_id 
									    from projects as p
									    where p.department_id = d.department_id));

--List the names of projects that have a budget higher than the average project budget.
select project_id, project_name 
from projects
where budget > (select AVG(budget) from projects);

--Find the department IDs of departments that have fewer than three employees.
select department_id 
from employees
group by department_id
having count(employee_id) < 3;

--Find the name of the employee with the highest salary in the company.
select emp_name 
from employees
where salary = (select max(salary) from employees);

--Find the names of departments that manage projects with a budget of less than $100,000.
select department_name
from departments
where department_id = (select department_id
						from projects 
						where budget < 18000);

--Identify the name and hire date of the most recently hired employee.
select emp_name, hire_date
from employees
where hire_date = (select max(hire_date) 
					from employees);
