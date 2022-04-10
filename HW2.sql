-- 1. Output all workers whose salaries are in the database,together with their salaries.
select employee_name, salary.monthly_salary as salary
from employees join salary
on employees.id = salary.id; 

-- 2. Show all workers whose salaries are less than 2000.
select employee_name, salary.monthly_salary as salary
from employees join salary
on employees.id = salary.id
where salary.monthly_salary < 2000;

-- 3. Output all salary positions, but the employee is not assigned to them. (There is a salary, but it is not clear who receives it).
select salary.monthly_salary, employees.employee_name
from salary left join employees
on salary.id = employees.id
where employee_name is null;

-- 4. Output all salary positions below 2000, but no staff member has been assigned to them. (There is a salary, but it is not clear who receives it).
select salary.id, salary.monthly_salary, employees.employee_name
from employees right join salary
on employees.id = salary.id
left join employee_salary
on employee_salary.id = salary.id
where monthly_salary < 2000 and employee_name is null;

-- 5. Output all employees who have not been assigned a salary.
select employees.employee_name, salary.monthly_salary
from employees right join salary
on employees.id = salary.id
left join employee_salary
on employee_salary.id = salary.id
where monthly_salary is not null;

-- 6. Output all employees with their job titles.
select employees.employee_name, roles.role_name
from roles right join employees
on roles.id = employees.id
left join roles_employee
on roles_employee.id = employees.id;

-- 7. Output names and positions of Java developers only.
select employees.employee_name, roles.role_name
from roles right join employees
on roles.id = employees.id 
left join roles_employee
on roles_employee.id = employees.id
where roles.role_name like '%Java developer';

-- 8. Output names and title of Python developers only.
select employees.employee_name, roles.role_name
from roles right join employees
on roles.id = employees.id 
left join roles_employee
on roles_employee.id = employees.id
where roles.role_name like '%Python%';

-- 9. Output names and title of all QA engineers.
select employees.employee_name, roles.role_name
from roles right join employees
on roles.id = employees.id 
left join roles_employee
on roles_employee.id = employees.id
where roles.role_name like '%QA%';

-- 10. Output the names and job titles of manual QA engineers.
select employees.employee_name, roles.role_name
from roles right join employees
on roles.id = employees.id 
left join roles_employee
on roles_employee.id = employees.id
where roles.role_name like '%Manual QA%';

-- 11. Output the names and job titles of the QA automators.
select employees.employee_name, roles.role_name
from roles right join employees
on roles.id = employees.id 
left join roles_employee
on roles_employee.id = employees.id
where roles.role_name like '%Automation QA%';

-- 12. Output names and salaries of Junior specialists.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id
right join roles
on employees.id = roles.id
where roles.role_name like '%Junior%';

-- 13. Output names and salaries of Middle specialists.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Middle%';

-- 14. Output names and salaries of Senior specialists.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Senior%';

-- 15. Output Java developers salaries.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Java developer';

-- 16. Output Python developers salaries.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Python%';

-- 17. Output names and salaries of Junior Python developers.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Junior Python%';

-- 18. Output names and salaries of Middle JS developers.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Middle JavaScript%';

-- 19. Output names and salaries of Senior Java developers.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Senior Java %';

-- 20. Output salaries of Junior QA engineers.
select employee_name, monthly_salary, role_name
from employees left join salary
on employees.id = salary.id 
right join roles
on employees.id = roles.id
where role_name like '%Junior%' and role_name like '%QA%' and role_name like '%Manual%';

-- 21. Output average salary of all Junior specialists.
select (select AVG(monthly_salary)
		from salary join roles
		on salary.id = roles.id 
		where role_name like '%Junior%') as AVG_Junior;
	
-- 22. Output the sum of JS developers salaries.
select (select SUM(monthly_salary)
		from salary join roles
		on salary.id = roles.id 
		where role_name like '%JavaScript%') as SUM_JS_dev;
	
-- 23. Output minimum salaries of QA engineers.
select (select MIN(monthly_salary)
		from salary join roles
		on salary.id = roles.id 
		where role_name like '%QA%') as MIN_QA;
	
-- 24. Output maximum salary of QA engineers
select (select MAX(monthly_salary)
		from salary join roles
		on salary.id = roles.id 
		where role_name like '%QA%') as MAX_QA;
	
-- 25. Output the number of QA engineers.
select count(employee_name) 
from employees left join salary
on salary.id = employees.id
right join roles
on employees.id = roles.id
where role_name like '%QA%';

-- 26. Output the number of Middle specialists.
select count(employee_name) 
from employees left join roles_employee
on employees.id = roles_employee.employee_id
right join roles
on roles.id = roles_employee.role_id
where role_name like '%Middle%';

-- 27. Output the number of developers.
select count(employee_name) 
from employees left join roles_employee
on employees.id = roles_employee.employee_id 
right join roles
on roles.id = roles_employee.role_id
where role_name like '%developer%';
	
-- 28. Output developers' salary fund (amount).
select (select SUM(monthly_salary)
		from salary join roles
		on salary.id = roles.id 
		where role_name like '%developer%') as SUM_dev;
	
-- 29. Output names, positions and salaries of all specialists in ascending order.
select employee_name, role_name, monthly_salary
from employees join roles
on employees.id = roles.id
join salary
on employees.id = salary.id
order by monthly_salary asc;

-- 30. Print names, positions and salaries of all specialists in ascending order from 1700 to 2300.
select employee_name, role_name, monthly_salary
from employees join roles
on employees.id = roles.id
join salary
on employees.id = salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;

-- 31. Display names, positions and earnings of all specialists in ascending order by specialists whose payroll is less than 2300.
select employee_name, role_name, monthly_salary
from employees join roles
on employees.id = roles.id
join salary
on employees.id = salary.id
where monthly_salary < 2300
order by monthly_salary asc;

-- 32. Print names, positions and salaries of all specialists in ascending order from those with a salary equal to 1100, 1500, 2000.
select employee_name, role_name, monthly_salary
from employees join roles
on employees.id = roles.id
join salary
on employees.id = salary.id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc;