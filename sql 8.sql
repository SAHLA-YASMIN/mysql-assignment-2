create database countryfield;
use countryfield;
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
(4, 'India', 66700000, 3287263),
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

SELECT c.country_name, COUNT(p.id) AS num_persons
FROM country c
LEFT JOIN persons p ON c.id = p.country_id
GROUP BY c.country_name;

SELECT c.country_name, COUNT(p.id) AS num_persons
FROM country c
LEFT JOIN persons p ON c.id = p.country_id
GROUP BY c.country_name
ORDER BY num_persons DESC;

SELECT c.country_name, AVG(p.rating) AS avg_rating
FROM country c
JOIN persons p ON c.id = p.country_id
GROUP BY c.country_name
HAVING AVG(p.rating) > 3.0;

SELECT DISTINCT c.country_name
FROM country c
JOIN persons p ON c.id = p.country_id
WHERE p.rating = (
    SELECT rating
    FROM persons p2
    WHERE p2.country_id = (SELECT id FROM country WHERE country_name = 'USA')
    LIMIT 1
);

SELECT country_name, population
FROM country
WHERE population > (SELECT AVG(population) FROM country);

CREATE DATABASE IF NOT EXISTS Product2;
USE Product2;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
    );
    
    CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

SELECT * FROM customer_info;

CREATE VIEW US_Customers AS
SELECT * 
FROM Customer
WHERE Country = 'US';

CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email,
    Phone_no,
    State
FROM Customer;

UPDATE Customer
SET Phone_no = '123-456-7890'  
WHERE State = 'California';

SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer_details
GROUP BY State;

SELECT * 
FROM Customer_details
ORDER BY State ASC;
