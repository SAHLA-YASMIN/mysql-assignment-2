create database countryfield22;
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
(4, 'India', 66700000000, 3287263),
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

SELECT 
    Persons.Id AS PersonID,
    Persons.Fname,
    Persons.Lname,
    Persons.Rating,
    Country.Country_name,
    Country.Population
FROM 
    Persons
INNER JOIN 
    Country
ON 
    Persons.Country_Id = Country.Id;
    
SELECT 
    Persons.Id AS PersonID,
    Persons.Fname,
    Persons.Lname,
    Persons.Rating,
    Country.Country_name,
    Country.Population
FROM 
    Persons
LEFT JOIN 
    Country
ON 
    Persons.Country_Id = Country.Id;

SELECT 
    Persons.Id AS PersonID,
    Persons.Fname,
    Persons.Lname,
    Persons.Rating,
    Country.Country_name,
    Country.Population
FROM 
    Persons
RIGHT JOIN 
    Country
ON 
    Persons.Country_Id = Country.Id;
    
    SELECT Country_name FROM Country
UNION
SELECT Country_name FROM Persons;

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

SELECT 
    Id AS PersonID, 
    Fname, 
    Lname, 
    ROUND(Rating) AS RoundedRating 
FROM 
    Persons;