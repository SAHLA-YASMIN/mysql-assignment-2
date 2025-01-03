create database countrytable1;
use countrytable1;
 -- create the country table
create table country (
id int primary key auto_increment,
country_name varchar (50) not null,
population int,
area int);
create table persons(
id int primary key auto_increment,
Fname varchar (50) not null,
Lname varchar (50) not null,
population int,
rating int,
country_id int ,
country_name varchar (50)
);
INSERT INTO Country (Id, Country_name, Population, Area)
 VALUES
(1, 'cannada', 556000000, 6733520),
(2, 'USA', 56000000, 6784670),
(3, 'india', 45800000, 578495),
(4, 'India', 667000000, 3287263),
(5, 'Australia', 68600000, 7692024),
(6, 'Germany', 83000000, 389022),
(7, 'France', 67000000, 551695),
(8, 'China', 1439323776, 9596961),
(9, 'Japan', 126000000, 377975),
(10, 'Brazil', 213000000, 8515767);
INSERT INTO persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name) 
VALUES
(1, 'sahla', 'yasmin', 0, 4.5, 1, 'USA'),
(2, 'rajla', 'thasneem', 0, 3.9, 2, 'Canada'),
(3, 'James', 'joe', 0, 4.7, 3, 'UK'),
(4, 'thomas', 'Davis', 0, 4.1, 4, 'India'),
(5, 'jobby', 'Johnson', 0, 3.8, 5, 'Australia'),
(6, 'Sarah', 'thomas', 0, 4.9, 9,null),
(7, 'David', 'john', 0, 4.6, 6, 'Germany'),
(8, 'safla', 'rahees', 0, 3.7, 7, 'France'),
(9, 'samsi', 'Harris', 0, 4.8, 8, 'China'),
(10, 'Sophia', 'Martin', 0, 4.0, 9, 'Japan');

ALTER TABLE Persons ADD DOB DATE;

DELIMITER //
CREATE FUNCTION CalculateAge (date_of_birth DATE) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
    RETURN age;
END //
DELIMITER ;

SELECT 
    Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM 
    Persons;


UPDATE Persons SET DOB = 
CASE 
    WHEN Id = 1 THEN '1985-05-15'
    WHEN Id = 2 THEN '1990-08-10'
    WHEN Id = 3 THEN '1980-12-20'
    WHEN Id = 4 THEN '1992-03-05'
    WHEN Id = 5 THEN '1987-07-19'
    WHEN Id = 6 THEN '1995-11-25'
    WHEN Id = 7 THEN '1982-02-14'
    WHEN Id = 8 THEN '1989-09-30'
    WHEN Id = 9 THEN '1991-01-01'
    WHEN Id = 10 THEN '1983-06-18'
END;


SELECT 
    Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM 
    Persons;
    

SELECT 
    Country_name, CHAR_LENGTH(Country_name) AS NameLength
FROM 
    Country;
    
SELECT 
    Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM 
    Country;

SELECT 
    Country_name, 
    UPPER(Country_name) AS UpperCaseName, 
    LOWER(Country_name) AS LowerCaseName
FROM 
    Country;

