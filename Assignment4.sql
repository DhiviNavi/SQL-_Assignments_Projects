

/*1. Create a stored procedure to display the restaurant name, type and cuisine where the
table booking is not zero.*/

Use Assignments
Select* from Jomato

Create proc USP_Restaurantbooking
AS
Begin

Select Restaurantname, RestaurantType,Cuisinestype  
from Jomato 
where Tablebooking >0
End;


Exec USP_Restaurantbooking


/* 2. Create a transaction and update the cuisine type ‘Cafe’ to ‘Cafeteria’. Check the result
and rollback it.*/

Begin Transaction
Update Jomato set CuisinesType='Cafeteria' where CuisinesType='Cafe';

Select *  from Jomato where CuisinesType='Cafeteria';

Rollback;


/*3. Generate a row number column and find the top 5 areas with the highest rating of
restaurants.*/




Select Area,Restaurantname,Rating ,Row_Number() Over (Order by Rating desc) rownum from Jomato


--4. Use the while loop to display the 1 to 50.


Declare @i Int=1;
While @i<=50

Begin
Print @i;
Set @i=@i+1;

End

/*5. Write a query to Create a Top rating view to store the generated top 5 highest rating of
restaurants.*/

Create View VW_Displaytoprating
AS
Select TOP 5 RestaurantName, Rating from Jomato where Rating <=5



select* from VW_Displaytoprating


/* 6. Write a trigger that sends an email notification to the restaurant owner whenever a new
record is inserted.*/


Create table  AuditLog (LogID Int Identity, Logmessage Varchar(Max),Logdate dateTime Default GetDate());

Create Table Aha_resutarunt(OrderID Int, RestaruantName Varchar(100));


Create Trigger ResInserted ON Aha_resutarunt
For Insert
AS 
Begin
Declare @OrderID Int
Declare @RestaruantName Varchar(Max)
Select @OrderID=OrderID, 
       @RestaruantName=RestaruantName 
       from Inserted;
Insert into Auditlog (Logmessage,Logdate) 
Values('New record' +@RestaruantName+ 'Inserted Succesfully', Getdate())
End;




Insert into  Aha_resutarunt (OrderID,RestaruantName) 
Values (1,'HANA');


Select * from Aha_resutarunt
Select * from Auditlog
