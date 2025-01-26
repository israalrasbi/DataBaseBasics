use CompanyDB;

--List All Departments and Their Employees
select d.department_name, e.emp_name
from departments d
left join employees e
on d.department_id = e.department_id;

--Find Projects Without Assigned Departments
select p.project_name, d.department_name
from projects p
left join departments d
on p.department_id = d.department_id
where d.department_id is null;

--List Departments Without Employees
select d.department_name
from departments d
left join employees e
on d.department_id = e.department_id
where e.department_id is null;
