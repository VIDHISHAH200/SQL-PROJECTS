create database employee;
create table employeeresignations(
EmployeeID INT PRIMARY KEY, 
Name VARCHAR(100), 
Gender VARCHAR(10), 
Age INT, 
Department VARCHAR(50), 
JobRole VARCHAR(50), 
DateOfJoining DATE, 
  DateOfExit DATE, 
    PerformanceRating INT, 
    ResignationReason VARCHAR(100), 
    LastWorkingLocation VARCHAR(50) 
); 
insert into employeeresignations values(1, 'Sneha Sharma', 'Female', 37, 'HR', 'HR Specialist', '2007-04-20', '2023-06-23', 5, 'Better 
Opportunity', 'Chennai'), 
(2, 'Ravi Sharma', 'Male', 27, 'HR', 'HR Specialist', '2016-05-02', '2024-01-31', 1, 'Work-life 
Balance', 'Hyderabad'), 
(3, 'Vikas Singh', 'Male', 50, 'Marketing', 'SEO Specialist', '2005-02-23', '2023-03-02', 2, 
'Retirement', 'Bangalore'), 
(4, 'John Patel', 'Male', 43, 'Sales', 'Sales Executive', '2013-07-10', '2015-08-10', 3, 'Low Job 
Satisfaction', 'Chennai'), 
(5, 'John Sharma', 'Female', 56, 'Sales', 'Sales Manager', '2006-10-08', '2020-02-24', 3, 'Work-life 
Balance', 'Kolkata'); 
select * from employees 
-- 1 department and job role with highest resignations 
select department, jobrole,count(*) as resignationcount
from employees
group by 1,2 
order by resignationcount desc;  
-- 2 average age and tenure at resignation 
select * from employees 
select avg(age), avg(datediff(dateofexit,dateofjoining)/365.25) as avgtenure
from employees 
-- 3 year wise trend is resignation--
select year(dateofexit) as exityear , count(*) as resigation
from employees
group by year(dateofexit)
order by exityear; 
-- most common resignation reasons --
select resignationreason, count(*)
from employees
group by resignationreason  
-- gender and deartment wise resignation split 
select gender, department,count(*)
from employees
group by 1,2
order by 1,2; 
-- performance rating at exit distribution 
select performancerating, count(*) as employeesexited
from employees
group by 1
order by 1 desc;



