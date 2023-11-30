/* 1. (Easy) Creating the schema and required tables using MySQL workbench
a. Create a schema named Travego and create the tables mentioned above with the mentioned
column names. Also, declare the relevant datatypes for each feature/column in the dataset.*/

create database Travego;
use Travego;

create table if not exists Passenger
(Passenger_id int,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20));

create table if not exists price
(id int,
Bus_Type varchar(20),
Distance int,
Price int);

-- b. Insert the data in the newly created tables.
insert into passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
(4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

insert into price values
(1, 'Sleeper', 350, 770.00),
(2, 'Sleeper', 500, 1100.00),
(3, 'Sleeper', 600, 1320.00),
(4, 'Sleeper', 700, 1540.00),
(5, 'Sleeper', 1000, 2200.00),
(6, 'Sleeper', 1200, 2640.00),
(7, 'Sleeper', 1500, 2700.00),
(8, 'Sitting', 500, 620.00),
(9, 'Sitting', 600, 744.00),
(10, 'Sitting', 700, 868.00),
(11, 'Sitting', 1000, 1240.00),
(12, 'Sitting', 1200, 1488.00),
(13, 'Sitting', 1500, 1860.00);

select * from passenger;
select * from price;

-- 2. (Medium) Perform read operation on the designed table created in the above task.
-- a. How many female passengers traveled a minimum distance of 600 KMs?

select count(*)
from passenger
where Gender = 'F' and Distance >= 600;

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and
-- who are traveling in a sleeper bus.
select * 
from passenger
where Distance > 500 and Bus_type like '%sleeper%';

-- c. Select passenger names whose names start with the character 'S'
select passenger_name
from passenger
where passenger_name like 'S%';

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output
select Passenger_name, Boarding_city, Destination_city, passenger.Bus_Type, Price 
from passenger, price
where passenger.Passenger_id = price.id;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select passenger.passenger_name, price.Price
from passenger, price
where passenger.passenger_id = price.id and passenger.Distance >= 1000;

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? 
select * from price 
where distance = (select distance from passenger 
where passenger_name = 'Pallavi');

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
update passenger
set category = 'Non-AC'
where Bus_Type = 'Sleeper';

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database. 

delete from passenger
where passenger_name = 'Piyush';
commit;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required)
truncate table passenger;

/* After executing this truncate command, the "Passenger" table will have no rows,
 and all data will be removed. 
 */

-- j. Delete the table passenger from the database. 
drop table passenger;

