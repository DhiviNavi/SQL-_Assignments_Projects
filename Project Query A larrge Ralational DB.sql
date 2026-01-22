

--3. Perform the following with help of the above database:

/*a. Get all the details from the person table including email ID, phone
number and phone number type*/

Select * From [Person].[Person]
Select * From [Person].[EmailAddress]
Select * From [Person].[PersonPhone]
Select * From [Person].[PhoneNumberType]

Select * From [Person].[Person] P
Inner Join
[Person].[EmailAddress] PE
ON
P.BusinessEntityID=PE.BusinessEntityID
Inner Join 
[Person].[PersonPhone] PP
on
PE.BusinessEntityID=PP.BusinessEntityID
Inner Join
[Person].[PhoneNumberType] PPT
on
PP.PhoneNumberTypeID=PPT.PhoneNumberTypeID;

--b. Get the details of the sales header order made in May 2011

Select * from [Sales].[SalesOrderHeader]
Select * from [Sales].[SalesOrderDetail]

select * from [Sales].[SalesOrderHeader]where MONTH(OrderDate)=05 and YEAR(OrderDate)=2011

/*c. Get the details of the sales details order made in the month of May
2011*/

Select * from [Sales].[SalesOrderHeader]
Select * from [Sales].[SalesOrderDetail]

Select * from [Sales].[SalesOrderDetail]SOD
Inner Join
[Sales].[SalesOrderHeader]SOH
on
SOD.SalesOrderID=SOH.SalesOrderID
Where Month(Orderdate)=5 and Year(Orderdate)=2011


--d. Get the total sales made in May 2011

Select * from [Sales].[SalesOrderHeader]
Select * from [Sales].[SalesOrderDetail]

Select Sum(Linetotal) AS Totalsales from [Sales].[SalesOrderDetail] SD
Inner Join 
[Sales].[SalesOrderHeader] SH
On
SD.SalesOrderID=SH.SalesOrderID
where Month(Orderdate)=5 and Year(orderdate)=2011

/*e. Get the total sales made in the year 2011 by month order by
 sales*/

Select * from [Sales].[SalesOrderHeader]
Select * from [Sales].[SalesOrderDetail]

 Select Sum(LineTotal) AS TotalSales, Month(Orderdate) from [Sales].[SalesOrderDetail] SD
 Inner Join
[Sales].[SalesOrderHeader] SH
 On
 SD.SalesOrderID=SH.SalesOrderID
 Where Year(Orderdate)=2011
 Group by Month(Orderdate)
 Order by Totalsales 


/*f.Get the detalies from the person table featch the first name start with G'' */

Select * from [Person].[Person] where FirstName Like('G%')

