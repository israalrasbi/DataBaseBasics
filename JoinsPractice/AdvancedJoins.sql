use CompanyDB;

--Find Employees Working in Departments Handling Projects With Budgets Greater Than 5000
select e.emp_name, p.project_name, p.budget
from employees e
inner join projects p
on e.department_id = p.department_id
where p.budget > 11000

--Find Employees and Their Projects With Department Details
select e.emp_name, p.project_name, d.department_name, d.loc
from employees e
inner join departments d
on e.department_id = d.department_id
inner join projects p
on p.department_id = d.department_id;

--Find Total Budget Managed by Each Employee’s Department
select d.department_name, d.loc, e.emp_name, sum(p.budget) as total_budget
from departments d
inner join projects p
on d.department_id = p.department_id
inner join employees e
on d.department_id = e.department_id
group by d.department_id, d.department_name, d.loc, e.emp_name;

--Identify Departments With More Than 2 Employees
select d.department_name
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name
having count(e.employee_id) > 2;

--Employees in Shared Locations
select e.emp_name, d.department_name, d.loc
from departments d
inner join employees e
on d.department_id = e.department_id
inner join departments d2
on d.loc = d2.loc and d.department_id != d2.department_id;
