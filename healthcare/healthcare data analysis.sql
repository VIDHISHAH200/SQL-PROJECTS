create database healthcare;
select * from health
-- describe characteristics of table health-
desc health;
--1) -- count the total records in database
select count(*) from health 
-- 2-- finding maximum age of patient admitted--
select max(age) as MAXIMUM_AGE from health;  
-- q3- find average age of hospitalized patient--
select round(avg(age),2) as average_age from health;
-- 4) calcualte patients admitted age wise from maximum to minimum..
select age,count(age) as totalpatient
from health
group by age
order by age desc;  
-- 5 ) Calculating Maximum Count of patients on basis of total patients hospitalized with respect to age.
select age,count(age) as total
from health
group by age
order by total desc , age desc;  
-- 6- ranking age on the number of patients hospitalized--
select age,count(age) as total,dense_rank()over(order by count(age) desc,age desc) as ranking_admitted
from health
group by age
having total > avg(age); -- count(age) has to be greater than avrage age
-- 7)- 7. Finding Count of Medical Condition of patients and lisitng it by maximum no of patients.
select `Medical Condition`,count(`Medical Condition`) as total_patients
from health
group by `Medical Condition`
order by total_patients desc; 
-- 8). Finding Rank & Maximum number of medicines recommended to patients based on Medical Condition pertaining to them.    
select `Medical Condition`,medication,count(medication) as total_medicines,rank() over(partition by `Medical Condition` order by count(medication) desc) as rank_medicine
from health
group by 1,2
order by 1; 
-- 9)Most preffered Insurance Provide  by Patients Hospatilized
select `Insurance Provider`,count(`Insurance Provider`) as total
from health
group by 1
order by total desc;
-- q10) -- 11. Identifying Average Billing Amount by Medical Condition.
select `Medical Condition`,round(avg(`Billing Amount`),2) as avgbill
from health 
group by 1
order by avgbill desc;  
-- 12. Finding Billing Amount of patients admitted and number of days spent in respective hospital.
select `Date of Admission`,`Discharge Date`
from health 
select datediff(`Discharge Date`,`Date of Admission`)
from health
-- 15. Calculate number of blood types of patients which lies betwwen age 20 to 45
select age, `Blood Type`,count(`Blood Type`) as total
from health
where age between 20 and 45
group by 1,2
order by total desc;
select `Discharge Date` from health
select `Date of Admission` from health  
--

