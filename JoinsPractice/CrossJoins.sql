use CompanyDB;

--Pair Employees With All Project
select e.emp_name, p.project_name
from employees e
cross join projects p;

--Generate a List of Department-Project Pairs
select d.department_name, p.project_name
from departments d
cross join projects p;