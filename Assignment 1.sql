USE Assignments

/* 2.  Add Primary key constraint for SalesmanId column in Salesman table. Add default
constraint for City column in Salesman table. Add Foreign key constraint for SalesmanId
column in Customer table. Add not null constraint in Customer_name column for the
Customer table.


Salesman Table
SalesmanId	Name	Commission	City	Age
101	Joe	50.00	California	17
102	Simon	75.00	Texas	25
103	Jessie	105.00	Florida	35
104	Danny	100.00	Texas	22
105	Lia	65.00	New Jersey	30

Customer Table
SalesmanId	CustomerId	CustomerName	PurchaseAmount
101	2345	Andrew	550
103	1575	Lucky	4500
104	2346	Andrew	4000
107	3747	Remona	2700
110	4004	Julia	4545

Orders Table
OrderId	CustomerId	SalesmanId	OrderDate	Amount
5001	2345	101	2021-07-01	550.00
5003	2346	105	2022-02-15	1500.00
5005	3747	104	2024-06-27	3200.00
*/

Create table Salesman(SalesmanID Int NOT Null primary key, Name Varchar(20), Commission Decimal(7,2),City Varchar(20), Age Int)

Insert into Salesman(SalesmanID, Name,Commission,City,Age) Values (101,'Joe',50.00, 'California',17),
(102, 'Simon',75.00,'Texas',25),
(103,'Jessie',105.00,'Floarida',35),
(104,'Danny',100.00,'Texas',22),
(105,'Lia',65.00,'New Jersey',30)

Create table Customer(SalesmanID Int not null primary key,CustomerID Int, CustomerName Varchar(20), PurchaseAmount Int)

Insert into Customer(SalesmanID,CustomerID,CustomerName,PurchaseAmount) Values(101,2345,'Andrew',550),
(102,1575,'Lucky',4500),
(103,2346,'Andrew',4000),
(104,3747,'Ramona',2700),
(105,4004,'Julia',4545)

Create table Orders (OrderID Int not null primary key,CustomerID Int,SalesmanID Int, OrderDate Date,Amount Decimal(10,2))

Insert into Orders(OrderID,CustomerID,SalesmanID, OrderDate,Amount)
Values(5001,2345,101, '2021-07-01',550.00),
(5003,1234,105,'2022-02-15',1500.00),
(5004,1575,103,'2024-06-27',3000.00);

Drop table Customer
Drop table Orders
Drop table Salesman

Select * From Salesman
Select* From Customer
Select* from Orders

//1.

Alter table Salesman 
Add Constraint PK_SM Primary Key (SalesmanID);

2.

Alter table Salesman
Add Constraint DK_SM Default 'texas' for City;

3.


Alter table Customer
Add Constraint FK_Customer Foreign key (SalesmanID) References Salesman(SalesmanID);

Insert into Customer(SalesmanID,CustomerID,CustomerName,PurchaseAmount) Values(106,2345,'Mani',440)--Check forignkey is working


Exec SP_help Customer;

SP_Help Customer
SP_Help Salesman




