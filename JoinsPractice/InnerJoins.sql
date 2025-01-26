use CompanyDB;

--Find Employees in the IT Department
select e.emp_name
from employees e
inner join departments d
on e.department_id = d.department_id
where d.department_name = 'IT';

--List Employees Working on Projects
select e.emp_name
from employees e
inner join projects p
on e.department_id = p.department_id;

--Find Employees and Their Projects
/*
fetch employees and project names even if the employee is not directly
assigned to a project but is in the same department as a project
*/
select e.emp_name, p.project_name
from employees e
left join projects p
on e.department_id = p.department_id
WHERE e.department_id IS NOT NULL AND p.department_id IS NOT NULL;
