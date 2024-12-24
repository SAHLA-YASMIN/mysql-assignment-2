 create database countryfield12;
 use countryfield12;
 
 create table country1 (
 Id int auto_increment primary key,
 Country_name varchar(50) not null,
 Population int,
 Area int);
 
 create table persons2(
 Id int auto_increment primary key,
 Fname varchar (50) not null,
 Lname varchar (50), 
 Population int,
 Rating int,
 Country_Id int,
 Country_name varchar(50));
 
 insert into country1( Id, Country_name, Population, Area) value
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

insert into persons2 (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)value
(1, 'sahla', 'yasmin', 0, 4.5, 1, 'USA'),
(2, 'rajla', 'thasneem', 0, 3.9, 2, 'Canada'),
(3, 'James', 'joe', 0, 4.7, 3, 'UK'),
(4, 'thomas', 'Davis', 0, 4.1, 4, 'India'),
(5, 'jobby', 'Johnson', 0, 3.8, 5, 'Australia'),
(6, 'Sarah', 'thomas', 0, 4.9, 9,'india'),
(7, 'David', 'john', 0, 4.6, 6, 'Germany'),
(8, 'safla', 'rahees', 0, 3.7, 7, 'France'),
(9, 'samsi', 'Harris', 0, 4.8, 8, 'China'),
(10, 'Sophia', 'Martin', 0, 4.0, 9, 'Japan');

-- 1.SQL query to print the first three characters of Country_name from the Country table
SELECT LEFT(Country_name, 3) AS ShortName FROM Country1;

select concat( Fname,' ', Lname) as fullname from persons2;

-- 3. SQL query to count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries FROM Persons2;

-- 4. a query to print the maximum population from the Country table
select max(Population) As maxpopulation from country1;

-- 5. query to print the minimum population from Persons table.
select min(Population) As minpopulation from country1;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
insert into persons2 (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)value
(11, 'ashik', Null, 0, 8.5, 4, 'algeria'),
(2, 'rajla', Null, 0, 1.9, 2, 'ksa');
select count(Lname) as lastnamecount from persons2;

-- 7. Find the number of rows in the Persons table
select count(*) as totalrow from persons2;

-- 8. SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT Population FROM Country1 LIMIT 3;

-- 9. Print 3 random rows of countries
SELECT * FROM Country1 ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order
SELECT * FROM Persons2 ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons2
GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_name
FROM Persons2
GROUP BY Country_name
HAVING SUM(Population) > 50000;

-- 13. List the total number of persons and average rating for each country,
-- but only for countries with more than 2 persons, ordered by the average rating in ascending order
SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating
FROM Persons2
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AvgRating ASC;