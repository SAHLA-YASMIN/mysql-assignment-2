-- ddl commands
create database managersfield1;

create table manager (
 manager_id int primary key auto_increment,
 first_name varchar (50) not null,
 last_name varchar (50) not null,
 date_of_birth date,
 age int,
 Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 Gender char(1) check (gender in('m','f')),
 department varchar (50),
 salary decimal (10,2) not null
 );
 
 insert into manager( manager_id,first_name,last_name,date_of_birth,age,Gender,department,salary)
 value
 (1, 'sahla', 'yasmin', '1990-05-14', 34, 'M', 'IT', 30000),
(2, 'rajla', 'thasneem', '1985-08-23', 39, 'F', 'HR', 25000),
(3, 'samseena', 'mole', '1995-12-01', 29, 'M', 'Finance', 40000),
(4, 'Aaliya', 'thasneem', '1990-03-10', 34, 'F', 'IT', 28000),
(5, 'Michael', 'farade', '1982-09-15', 42, 'M', 'Marketing', 32000),
(6, 'john', 'Davis', '1993-07-25', 31, 'F', 'IT', 35000),
(7, 'James', 'Wilson', '1998-04-30', 26, 'M', 'Finance', 20000),
(8, 'sophy', 'james', '1987-11-12', 37, 'F', 'HR', 15000),
(9, 'mohamed', 'ayaan', '1995-06-20', 29, 'M', 'Marketing', 18000),
(10, 'shamik', 'thasneek', '1990-02-28', 34, 'F', 'IT', 29000);

 select *from manager;
 
 SELECT First_name, Last_Name, date_of_birth
FROM Manager
WHERE Manager_Id = 1;

SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Manager;

select *from manager where not first_name = 'aaliya';

select *from manager where department = 'IT' AND SALARY>25000;

select *from manager where salary between 10000 and 35000;