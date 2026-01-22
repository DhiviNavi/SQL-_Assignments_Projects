
/* 1. Insert a new record in your Orders table.

Query: 
INSERT INTO Orders (OrderId, CustomerId, SalesmanId, OrderDate, Amount)
VALUES (5005, 1575, 103, '2023-05-20', 3000.00);

Output:

OrderId	CustomerId	SalesmanId	OrderDate	 Amount
5001	2345	101	2021-07-01	550.00
5003	1234	105	2022-02-15	1500.00
5004	1575	103	2024-06-27	3000.00  */

Create Database Assignments
Use Assignments

Create table Orders (OrderID Int,CustomerID Int,SalesmanID Int, OrderDate Date,Amount Decimal(10,2))

Drop table Orders

Insert into Orders(OrderID,CustomerID,SalesmanID, OrderDate,Amount)
Values(5001,2345,101, '2021-07-01',550.00),
(5003,1234,105,'2022-02-15',1500.00),
(5004,1575,103,'2024-06-27',3000.00);

Select* from Orders
