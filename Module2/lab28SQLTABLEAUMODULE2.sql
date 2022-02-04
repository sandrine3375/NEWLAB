
USE employees_mod;

SELECT YEAR(d.from_date) as calendar_year, e.gender, COUNT(e.emp_no) as num_of_employees 
FROM t_employees e 
JOIN t_dept_emp d on d.emp_no=e.emp_no 
GROUP BY calendar_year, e.gender 
HAVING calendar_year>=1990;

#2
SELECT m.*, e.*, d.*
FROM t_dept_manager m
inner join t_employees e
on m.emp_no = e.emp_no
left join t_departments d
on m.dept_no =d.dept_no;


SELECT YEAR(d.from_date) as calendar_year, e.gender, COUNT(m.emp_no) as number_manager, dd.dept_name as department 
FROM t_employees e 
JOIN t_dept_emp d on d.emp_no=e.emp_no 
JOIN t_dept_manager m ON m.emp_no=e.emp_no 
JOIN t_departments dd on dd.dept_no=d.dept_no
GROUP BY calendar_year, e.gender 
HAVING calendar_year>=1990;



#3

SELECT YEAR(d.from_date) as calendar_year, e.gender, 
COUNT(e.emp_no) as num_of_employees,SUM(s.salary),dd.dept_name 
FROM t_employees e 
JOIN t_dept_emp d on d.emp_no=e.emp_no 
JOIN t_salaries s ON s.emp_no=e.emp_no 
JOIN t_departments dd ON dd.dept_no=d.dept_no 
GROUP BY calendar_year, e.gender,dd.dept_name 
HAVING calendar_year <= 2002;
