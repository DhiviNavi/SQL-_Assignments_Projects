/*1. Display the count of customers in each region who have done the
transaction in the year 2020.*/

Use Assignments
Select * from Customers

Select Count(Customer_Id) AS Count_of_Customer,region_id from Customers where Year(End_date)=2020 group by region_id Order by region_id 

/*2. Display the maximum and minimum transaction amount of each
transaction type.*/

Select * from Transactions

Select Txn_type,Max(Txn_Amount) AS Maximum_amount,Min(Txn_amount) AS Minimum_amount from Transactions group by Txn_type


/*3. Display the customer id, region name and transaction amount where
transaction type is deposit and transaction amount > 2000.*/

Select * from Customers
Select * from Transactions
Select* from Continent

Select CU.Customer_Id,CO.Region_Name,T.Txn_amount 
from Customers CU
Inner Join
Continent CO
ON
CU.region_id=CO.region_id
Inner Join
Transactions T
ON
CU.customer_id=T.Customer_Id
Where txn_type='Deposit' And (txn_amount)>2000;

--4. Find duplicate records in the Customer table.

Select Customer_Id from Customers group by Customer_Id having Count(*) >1


/*5. Display the customer id, region name, transaction type and transaction
amount for the minimum transaction amount in deposit.*/

Select CU.Customer_ID,CO.Region_Name,T.Txn_type,T.Txn_amount 
from Customers CU
Inner Join
Continent CO
ON
CU.region_id=CO.region_id
Inner Join
Transactions T
ON
CU.customer_id= T.Customer_Id
where txn_amount=
(select Min(txn_amount) from Transactions where txn_type='Deposit')

/*6. Create a stored procedure to display details of customers in the
Transaction table where the transaction date is greater than Jun 2020.*/

Select * from Customers
Select * from Transactions


Create Proc USP_Tansfunc
AS
(
Select CU.Customer_Id,CU.Region_id,CU.Start_date,CU.End_date 
from Customers CU
Left Join
Transactions T
ON
T.Customer_Id=Cu.customer_id
Where T.Txn_date >'2020-06-01'
)

Exec USP_Tansfunc

--7. Create a stored procedure to insert a record in the Continent table.

Select* from Continent

Create proc USP_InsertContinent
@region_Id int,
@Region_Name Varchar (100)
AS
Begin
Insert into Continent(Region_Id,Region_Name) 
Values(@Region_Id, @Region_Name);
End;

Exec USP_InsertContinent 6,'India';

/*8. Create a stored procedure to display the details of transactions that
happened on a specific day.*/

Select * from Transactions

Create Proc USP_Specificday
@TxnDate Date
AS
Begin
Select * from Transactions where Txn_date=@Txndate;
End;

Exec USP_Specificday '2020-01-21'

/*9. Create a user defined function to add 10% of the transaction amount in a
table.*/	

create function USP_Txn_percent()
Returns table
AS
Return
(
Select 
Customer_Id,
Txn_amount ,
Txn_amount * 1.10 AS Increased_Amount
from Transactions
);

Select 
Customer_Id,
Txn_amount * 1.10 AS Increased_Amount from DBO.USP_Txn_percent()

/*10. Create a user defined function to find the total transaction amount for a
given transaction type.*/

Create function USP_Totaltans(@Txn_Type Varchar(50))
Returns table
AS
Return
(
Select @Txn_type AS Txn_Type,
Sum(Txn_Amount) AS Total_Transaction_amt 
from Transactions 
where @Txn_Type=Txn_type
);

Select * from DBO.USP_Totaltans('Deposit')

/*11. Create a table value function which comprises the columns customer_id,
region_id ,txn_date , txn_type , txn_amount which will retrieve data from
the above table.*/

Select * from Customers
Select * from Transactions

create function USP_Retrivedata
(
@Customer_Id Int,
@Region_Id Int,
@Txn_Type Varchar(50),
@txn_Amount Decimal(10,2))

Returns Table
AS
Return
(
Select 
CU.customer_id,
CU.Region_Id,
T.Txn_type,
T.Txn_Amount 
from Customers CU
Inner Join 
Transactions T
ON
CU.customer_id=T.customer_id
Where @Region_Id=region_id AND @Customer_Id=@Customer_Id
AND @Txn_Type=Txn_Type AND Txn_Amount=Txn_Amount
);

Select
customer_id,
Region_Id,
Txn_type,
Txn_Amount 
from DBO.USP_Retrivedata(1,3,'Deposit',712)


/*12. Create a TRY...CATCH block to print a region id and region name in a
single column.*/


Select * from Customers
Select * from Transactions
Select* from Continent

Begin try

Select CAST(Region_Id AS Varchar) + '-' + Region_Name AS Region_Details
From Continent

End try

Begin Catch

Print 'Error occored while retriving data'
Print Error_Message();
End Catch

--13. Create a TRY...CATCH block to insert a value in the Continent table.

Begin try
Insert into Continent(Region_Id,Region_Name) Values(7,'Antartica');
End try

Begin Catch
Print 'Error occored while Inserting data'
Print Error_Message();
End Catch;


--14. Create a trigger to prevent deleting a table in a database.

Create trigger Alerttrigger
ON Database
For Drop_table
AS
Begin 
Print 'You are not allowed to delete or drop the table'
Rollback;
End

Drop table continent

Drop Trigger alerttrigger ON Database;

--15. Create a trigger to audit the data in a table.

Create table Audit_log
(AuditID int Identity(1,1),
Action_type Varchar(Max),
Action_date Datetime Default getdate());

Select* from Continent


Create trigger Trg_Audittab
ON Continent
After Insert,Update,Delete
AS
Begin

INSERT INTO Audit_Log (Action_Type, Action_Date)
    SELECT 
        'New record with Region_Id = ' + CAST(Region_Id AS NVARCHAR(10)) + 
        ' is INSERTED into Continent table',
        GETDATE()
    FROM inserted;

    
    INSERT INTO Audit_Log (Action_Type, Action_Date)
    SELECT 
        'Record with Region_Id = ' + CAST(Region_Id AS NVARCHAR(10)) + 
        ' is DELETED from Continent table',
        GETDATE()
    FROM deleted;
End


Delete from Continent where Region_Id=1;
Insert into Continent values(9, 'UK')

Update Continent set Region_Name='America' where Region_Id=1

Select * from Audit_Log

--16. Create a trigger to prevent login of the same user id in multiple pages.

CREATE TABLE Active_Logins
(
    LoginName SYSNAME,
    LoginTime DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER trg_PreventMultipleLogins
ON ALL SERVER
FOR LOGON
AS
BEGIN
    DECLARE @LoginName SYSNAME;
    SET @LoginName = ORIGINAL_LOGIN();

    IF EXISTS (SELECT 1 FROM Active_Logins WHERE LoginName = @LoginName)
    BEGIN
        ROLLBACK;
    END
    ELSE
    BEGIN
        INSERT INTO Active_Logins (LoginName)
        VALUES (@LoginName);
    END
END;

Drop Trigger trg_PreventMultipleLogins ON Database;

17. Display top n customers on the basis of transaction type.

Declare @N int=5

SELECT TOP (@N)
    Customer_Id,
    Txn_Type,
    COUNT(*) AS Transaction_Count
FROM Transactions
WHERE Txn_Type = 'Deposit'
GROUP BY Customer_Id, Txn_Type
ORDER BY Txn_Type DESC;


/*18. Create a pivot table to display the total purchase, withdrawal and
deposit for all the customers*/

Select * from(Select 
Customer_Id,
Txn_Type,Txn_amount 
from Transactions ) 
AS Sourcetable 
PIVOT 
(SUM(Txn_Amount)
    FOR Txn_Type IN ([Purchase], [Withdrawal], [Deposit])
) AS PivotTable;