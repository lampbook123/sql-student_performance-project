-- student perforfance SQL Analytics 
--Author: harsh singh
-- Database : MYSQL
-- Description: Queries used to analyze factors affecting student performance.




use student_db;
show tables;
select count(*) as total_rows from
student_data;
select * from student_data limit 5; 

select avg(G3) as avg_final_grade  -- average of g3
from student_data;

select sex , avg(G3) as avg_g3  -- average G3 by sex
from student_data 
group by sex;

select absences , avg(G3) from student_data
group by absences;
select schoolsup , avg(G3) from student_data  -- grades from schoolsupport
group by schoolsup;

select school , count(*) as num_students  -- count students by school 
from student_data 
group by school;

select studytime , avg(G3) from student_data
group by studytime;

select failures , avg(G3) from student_data
group by  failures;

select internet , avg(G3) from student_data
group by internet;
select goout  , avg(G3) from student_data
group by goout;

select famsize , avg(G3)  as average_grade from student_data
group by famsize;

select romantic , avg(G3) from student_data
group by romantic;

select case when absences between 0 and 10 then '0-10'
when absences between 11 and 20 then '11-20'         -- checking group of absences with average grades
when absences between 21 and 30  then "21-30"
else "30+"
end as  absence_group , avg(G3) as avg_grade from student_data
group by absence_group
order by absence_group;

select case when absences between 0 and 10 then '0-10'
when absences between 11 and 20 then '11-20' 
when absences between 21 and 30  then "21-30"
else "30+"
end as  absence_group ,
count(*) as no_of_students, avg(G3) as avg_grade from student_data  -- checking no. of students in group
group by absence_group
order by absence_group;

select health , count(*) ,avg(G3) as avg_grades from student_data
group by health;

select health ,studytime , avg(G3) from student_data
group by health , studytime
order by health , studytime;

select health , failures ,avg(G3) as avg_grade from student_data  -- access comparison on avg due to health and failure.
group by health , failures
order by health , failures;

select health ,goout , avg(G3) from student_data
group by health , goout
order by health , goout; 

select studytime , count(*) as no_of_students, goout from student_data   -- it access avg of grades and with studytime with no of students.
group by studytime , goout
order by  studytime,  goout; 
 
select failures , count(*) ,internet from student_data  -- it compares failures with internet 
group by failures, internet;

select Medu , Fedu , count(*), avg(G3) from student_data
group by Medu , Fedu ;

select Medu , Fedu ,failures , count(*)   as students , avg(G3) 
from student_data
group by  Medu , Fedu ,  failures  -- access comparison of failures due to medu, fedu.
order by Medu ,Fedu , failures; 

select Dalc, Walc , avg(G3) as avg_grade,  count(*) as students
 from student_data
group by Dalc , Walc 
order by Dalc , Walc;





