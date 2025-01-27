use CompanyDB;

--Find Employees Hired After Their Colleagues in the Same Department
select e1.emp_name as employee_name, e2.emp_name as colleague_name
from employees e1
inner join employees e2
on e1.department_id = e2.department_id
where e1.hire_date > e2.hire_date; 

--List Employees With the Same Salary in the Same Department
select e1.emp_name as employee_name, e1.salary as employee_salary, e2.emp_name as colleague_name, e2.salary as colleague_salary
from employees e1
inner join employees e2
on e1.department_id = e2.department_id
where e1.salary = e2.salary and e1.employee_id != e2.employee_id;
