/*Prerequisite: create database, create and populate tables*/
CREATE DATABASE IF NOT EXISTS Lucky_Shrub; 

USE Lucky_Shrub; 
 /*Creating tables*/
CREATE TABLE Clients (ClientID VARCHAR(10) primary key, FullName VARCHAR(100), ContactNumber INT, AddressID INT); 
  
CREATE TABLE Products (ProductID VARCHAR(10) primary key, ProductName VARCHAR(100), BuyPrice DECIMAL(6,2), SellPrice DECIMAL(6,2), NumberOfItems INT);  
  
Create table Addresses(AddressID INT PRIMARY KEY, Street VARCHAR(255), County VARCHAR(100)); 
  
CREATE TABLE Employees (EmployeeID INT primary key, FullName VARCHAR(100), JobTitle VARCHAR(50), Department VARCHAR(200), AddressID INT);  
  
CREATE TABLE Activity( ActivityID INT PRIMARY KEY, Properties JSON ); 
  
CREATE TABLE Audit(AuditID INT AUTO_INCREMENT PRIMARY KEY, OrderDateTime TIMESTAMP NOT NULL  );  
  
CREATE TABLE Orders (OrderID INT NOT NULL PRIMARY KEY,  
ClientID VARCHAR(10), ProductID VARCHAR(10), Quantity INT, Cost DECIMAL(6,2), Date DATE,  
FOREIGN KEY (ClientID) REFERENCES Clients(ClientID), 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)); 

CREATE TABLE Notifications (NotificationID INT AUTO_INCREMENT PRIMARY KEY, Notification VARCHAR(256), DateTime TIMESTAMP NOT NULL); 

/*populating tables*/    

INSERT INTO Employees (EmployeeID, FullName, JobTitle, Department, AddressID) VALUES    
(1, "Seamus Hogan", "Manager", "Management", 7),    
(2, "Thomas Eriksson", "Assistant ", "Sales", 8),   
(3, "Simon Tolo", "Head Chef", "Management", 9),   
(4, "Francesca Soffia", "Assistant  ", "Human Resources", 10),   
(5, "Emily Sierra", "Accountant", "Finance", 11),    
(6, "Greta Galkina", "Accountant", "Finance", 12);  

INSERT INTO Activity(ActivityID, Properties) VALUES   
(1, '{ "ClientID": "Cl1", "ProductID": "P1", "Order": "True" }' ),   
(2, '{ "ClientID": "Cl2", "ProductID": "P4", "Order": "False" }' ),   
(3, '{ "ClientID": "Cl5", "ProductID": "P5", "Order": "True" }' ); 
  
INSERT INTO Clients(ClientID, FullName, ContactNumber, AddressID) VALUES   
  
("Cl1", "Takashi Ito", 351786345, 1),   
("Cl2", "Jane Murphy", 351567243, 2),   
("Cl3", "Laurina Delgado", 351342597, 3),   
("Cl4", "Benjamin Clauss", 351342509, 4),   
("Cl5", "Altay Ayhan", 351208983, 5),   
("Cl6", "Greta Galkina", 351298755, 6);     
  
 INSERT INTO Products (ProductID, ProductName, BuyPrice, SellPrice, NumberOfITems) VALUES   
("P1", "Artificial grass bags ", 40, 50, 100),   
("P2", "Wood panels", 15, 20, 250),   
("P3", "Patio slates", 35, 40, 60),   
("P4", "Sycamore trees ", 7, 10, 50),   
("P5", "Trees and Shrubs", 35, 50, 75),   
("P6", "Water fountain", 65, 80, 15); 
  
INSERT INTO Addresses(AddressID, Street, County) VALUES   
(1, ",291 Oak Wood Avenue", "Graham County"),   
(2, "724 Greenway Drive", "Pinal County"),   
(3, "102 Sycamore Lane", "Santa Cruz County"),   
(4, "125 Roselawn Close", "Gila County"),   
(5, "831 Beechwood Terrace", "Cochise County"),  
(6, "755 Palm Tree Hills", "Mohave County"),   
(7, "751 Waterfall Hills", "Tuscon County") ,   
(8, "878 Riverside Lane", "Tuscon County") ,   
(9, "908 Seaview Hills", "Tuscon County"),   
(10, "243 Waterview Terrace", "Tuscon County"),   
(11, "148 Riverview Lane", "Tuscon County"),    
(12, "178 Seaview Avenue", "Tuscon County");  

INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date) VALUES     
(1, "Cl1", "P1", 10, 500, "2020-09-01" ),   
(2, "Cl2", "P2", 5, 100, "2020-09-05"),   
(3, "Cl3", "P3", 20, 800, "2020-09-03"),   
(4, "Cl4", "P4", 15, 150, "2020-09-07"),   
(5, "Cl3", "P3", 10, 450, "2020-09-08"),   
(6, "Cl2", "P2", 5, 800, "2020-09-09"),   
(7, "Cl1", "P4", 22, 1200, "2020-09-10"),  
(8, "Cl3", "P1", 15, 150, "2020-09-10"),     
(9, "Cl1", "P1", 10, 500, "2020-09-12"),   
(10, "Cl2", "P2", 5, 100, "2020-09-13"),   
(11, "Cl4", "P5", 5, 100, "2020-09-15"),  
(12, "Cl1", "P1", 10, 500, "2022-09-01" ),   
(13, "Cl2", "P2", 5, 100, "2022-09-05"),   
(14, "Cl3", "P3", 20, 800, "2022-09-03"),   
(15, "Cl4", "P4", 15, 150, "2022-09-07"),   
(16, "Cl3", "P3", 10, 450, "2022-09-08"),   
(17, "Cl2", "P2", 5, 800, "2022-09-09"),   
(18, "Cl1", "P4", 22, 1200, "2022-09-10"),   
(19, "Cl3", "P1", 15, 150, "2022-09-10"),   
(20, "Cl1", "P1", 10, 500, "2022-09-12"),   
(21, "Cl2", "P2", 5, 100, "2022-09-13"),    
(22, "Cl2", "P1", 10, 500, "2021-09-01" ),   
(23, "Cl2", "P2", 5, 100, "2021-09-05"),   
(24, "Cl3", "P3", 20, 800, "2021-09-03"),   
(25, "Cl4", "P4", 15, 150, "2021-09-07"),   
(26, "Cl1", "P3", 10, 450, "2021-09-08"),   
(27, "Cl2", "P1", 20, 1000, "2022-09-01" ),   
(28, "Cl2", "P2", 10, 200, "2022-09-05"),   
(29, "Cl3", "P3", 20, 800, "2021-09-03"),   
(30, "Cl1", "P1", 10, 500, "2022-09-01" ); 

show tables;

/*THE TASKS*/

/* creating the function FindAverageCost() that returns the average sale price value of all products
 in a specific year based on the user input*/
 
drop function if exists FindAverageCost;

create function FindAverageCost(YearInput int) returns decimal(6,2) deterministic
return(select avg(cost) from Orders where YEAR(Date) = YearInput);

select FindAverageCost(2022);

/* Create the EvaluateProduct stored procedure that outputs the total number of items sold during 
the last three years for the P1 Product ID. Input the ProductID when invoking the procedure.*/

drop procedure if exists EvaluateProducts;

delimiter //
create procedure EvaluateProducts(in product_id varchar(10), out ItemsSold2020 int, out ItemsSold2021 int, 
Out ItemsSold2022 int)
begin
select sum(Quantity) into ItemsSold2020 from Orders where year(Date) = 2020 and ProductID = product_id;
select sum(Quantity) into ItemsSold2021 from Orders where year(Date) = 2021 and ProductID = product_id;
select sum(Quantity) into ItemsSold2022 from Orders where year(Date) = 2022 and ProductId = product_id;
end //
delimiter ;

call EvaluateProducts("P1", @ItemsSold2020, @ItemsSold2021, @ItemsSold2022);

select "P1", @ItemsSold2020, @ItemsSold2021, @ItemsSold2022;

/*Create a trigger called UpdateAudit. This trigger must be invoked automatically AFTER a new 
order is inserted into the Orders table */
drop trigger UpdateAudit;
create trigger UpdateAudit after insert on Orders for each row 
insert into Audit(AuditID, OrderDateTime) values (curent_timestamp);

/*inserting a new order to invoke the trigger*/

INSERT INTO Orders (OrderID, ClientID, ProductID , Quantity, Cost, Date) VALUES     
(31, "Cl1", "P1", 10, 500, "2020-09-14"),   
(32, "Cl2", "P2", 5, 100, "2020-09-15");   

show triggers;


/*showing the audit table to see the new row entered because of the trigger*/
select * from Audit;

/*Display full name of all clients and employees from the Clients and Employees tables and the address of each person
from the Addresses table. Order the data by the street name*/
select Clients.FullName, Addresses.County, Addresses.Street from Clients inner join Addresses on 
Clients.AddressID = Addresses.AddressID 
union
select Employees.FullName, Addresses.County, Addresses.Street from Employees inner join Addresses on 
Employees.AddressID = Addresses.AddressID
order by Street;

/*Optimizing query by recreating it as a common table expression (CTE).*/

with
P2Sale2020 as (select concat(sum(Cost), " (2020)") as "Total sum of P2 Product"
from Orders where YEAR (Date) = 2020 and ProductID = "P2"),
P2Sale2021 as (select concat (sum(Cost), " (2021)") as "Total sum of P2 Product" 
from Orders where YEAR (Date) = 2021 and ProductID = "P2"),
P2Sale2022 as (select concat (sum(Cost), " (2022)") as "Total sum of P2 Product" 
from Orders where YEAR (Date) = 2022 and ProductID = "P2")
select * from P2Sale2020
union
select * from P2Sale2021
union
select * from P2Sale2022;

/* The system logs the ClientID and the ProductID information for each activity in a JSON Properties column inside 
the Activity table. while clients browse through Lucky Shrub products online. Extract the following information:
-The full name and contact number of each client from the Clients table.  
-The ProductID for all clients who performed activities. */

select Activity.Properties ->>'$.ClientID' as ClientID, Activity.Properties ->>'$.ProductID' 
as ProductID, Clients.FullName, Clients.ContactNumber from Clients right join Activity 
on Clients.ClientID = Activity.Properties ->>'$.ClientID';

/*Create a stored procedure called GetProfit that returns the overall profits generated by a specific product
 in a specific year. This should be based on the user input of the ProductID and Year. */
DELIMITER // 
create procedure GetProfit(in product_id varchar(20),in YearInput int)
begin
declare profit decimal(7,2) default 0.0; 
declare sold_quantity, buy_price, sell_price int default 0;
select sum(Quantity) into sold_quantity from Orders where ProductID = product_id and YEAR(Date) = YearInput; 
select BuyPrice into buy_price from Products where ProductID = product_id; 
select SellPrice into sell_price from Products where ProductID = product_id;
set profit = (sell_price * sold_quantity) - (buy_price * sold_quantity);
select profit; 
end //
DELIMITER ;

/*calling the procedure by its name*/
CALL GetProfit('P1', 2020);

drop view if exists DataSummary;

/*Create a virtual table called DataSummary that joins together these four tables Clients, Addresses, Orders &
 Products. IT should be a summary of their client's details, their addresses, order details and the products
 they purchased. Show relevant data for year 2022 only. Order the data by the cost of the highest order. */

 create view  DataSummary as select Clients.FullName, Clients.ContactNumber, Addresses.County, Products.ProductName,
 Orders.ProductID, Orders.Cost, Orders.Date from Clients inner join Addresses on 
 Clients.AddressID = Addresses.AddressID inner join Orders ON Clients.ClientID = Orders.ClientID inner join
 Products on Orders.ProductID = Products.ProductID where YEAR(Orders.Date) = 2022 order by Orders.Cost desc;

 /*showing data from the temporay table*/
 select * from DataSummary;