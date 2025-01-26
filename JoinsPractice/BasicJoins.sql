use CompanyDB;

--Find Employee and Their Department Name
select e.emp_name as Employee_name, d.department_name as Department_name 
from departments d, employees e
where d.department_id = e.department_id;

--List Projects and Their Department Locations
select p.project_name, d.loc
from projects p, departments d
where p.department_id = d.department_id;

--Find Employees Without Departments
select e.emp_name
from employees e
left join departments d
on e.department_id = d.department_id
where  e.department_id is null;


--List All Projects and Assigned Departments
select p.project_name, d.department_name
from projects p
left join departments d
on p.department_id = d.department_id;
