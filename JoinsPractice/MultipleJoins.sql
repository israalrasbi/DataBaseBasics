use CompanyDB;

/*
Find all departments and their projects along with the employees working in each department. 
Include departments with no employees or projects. */
select d.department_name, p.project_name, e.emp_name
from departments d
left join projects p
on d.department_id = p.department_id
left join employees e
on d.department_id = e.department_id;

/*
Retrieve a list of employees who are part of departments that have projects assigned.
Include employees from departments with no projects.*/
select e.emp_name, d.department_name, p.project_name
from employees e
inner join departments d
on e.department_id = d.department_id
left join projects p
on e.department_id = p.department_id;

/*
List all departments and the number of employees in each department. 
Include departments with no employees.*/
select d.department_name, count(e.employee_id) as number_of_emp
from departments d
left join employees e
on d.department_id = e.department_id
group by d.department_name;

/*
Find all employees and display their department names along with project names, 
even if the department or project is missing.*/
select  e.emp_name, d.department_name, p.project_name
from employees e
left join departments d
on e.department_id = d.department_id
left join projects p
on e.department_id = p.department_id;

/*
List all employees, their department names, and the total budget of projects in their department.
Include employees without a department or a department without projects.*/
select e.emp_name, d.department_name,sum(p.budget) as total_budget
from employees e
left join departments d
on e.department_id = d.department_id
left join projects p
on e.department_id = p.department_id
group by e.emp_name, d.department_name;

/*
Retrieve a list of projects and their assigned departments, 
including projects with no department and departments with no projects.*/
select p.project_name, d.department_name
from projects p
full outer join departments d
on p.department_id = d.department_id;

/*
Display all departments and their employees, including departments with no employees*/
select d.department_id, d.department_name, e.emp_name
from departments d
left join employees e
on d.department_id = e.department_id;

/*
Find all employees along with their department names and the projects they are working on. 
Include employees who are not assigned a department or project.*/
select  e.emp_name, d.department_name, p.project_name
from employees e
left join departments d
on e.department_id = d.department_id
left join projects p
on e.department_id = p.department_id;

/*
List all projects along with the department names. 
Include projects that are not linked to any department.*/
select p.project_name, d.department_name
from projects p
left join departments d
on p.department_id = d.department_id;

/*
Find all employees along with their department names. 
Include employees without a department.*/
select e.emp_name, d.department_name
from employees e
left join departments d
on e.department_id = d.department_id;