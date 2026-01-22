

Use Assignments

--3. Fetch the data where the Customer’s name is ending with ‘N’ also get the purchase amount value greater than 500



Insert into Customer (SalesmanID, CustomerID,CustomerNAme,PurchaseaMount) Values(111,4005,'John',4000),(112,4006,'Aaryan',3000)

Select * From Salesman
Select* from Customer
Select* from Orders

Select * from Customer Where CustomerName Like '%N' AND PurchaseAmount>500;



/*  4. Using SET operators, retrieve the first result with unique SalesmanId values from two
tables, and the other result containing SalesmanId with duplicates from two tables.*/


Select SalesmanID from Salesman
UNION
Select SalesmanID from Customer

Select SalesmanID from Salesman
UNION ALL
Select SalesmanID from Customer


/*  5. Display the below columns which has the matching data.
Orderdate, Salesman Name, Customer Name, Commission, and City which has the
range of Purchase Amount between 500 to 1500.*/



Select O.OrderDate,S.Name,C.CustomerName,S.Commission, S.City
From
Orders AS O
JOIN
Customer AS C ON O.CustomerID=C.CustomerID
JOIN 
Salesman AS S ON O.SalesmanID=S.SalesmanID
Where 
PurchaseAmount between
500 AND 1500;

--6. Using right join fetch all the results from Salesman and Orders table.


Select S.SalesmanID,S.Name,S.Commission,S.City,O.OrderID,O.CustomerID,O.SalesmanID,O.OrderDate,O.Amount
From
Salesman S
Right Join
Orders O ON O.SalesmanID=S.SalesmanID;