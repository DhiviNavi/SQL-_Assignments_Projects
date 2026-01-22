Create table Location1
(LocationId Int Primary key,
City Varchar(20))


INSERT INTO LOCATION1 (LocationId, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');

Create table Department (DeptId Int Primary key, Name Varchar(50),LocationId Int Foreign key(LocationId) references Location1(LocationId));

INSERT INTO DEPARTMENT (DeptId, Name, LocationId)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);


Create table Job(JobId Int Primary Key, Designation Varchar(50));

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')

Create table Employee(Emp_ID Int, Last_Name Varchar(50), First_Name Varchar(50), Middle_Name Varchar(50),
Job_Id Int Foreign key (Job_Id) references Job(JobId),Hire_Date Date,Salary Int,Commision Int,
Dept_Id Int Foreign key(Dept_Id) References Department(DeptId));

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,'22-FEB-85',1250,500,30)



Select*from Location1
Select* from Employee
Select* from Department
Select *from Job

--Simple Queries

--1. Listall the employeedetails.

Select * from Employee

--2. Listall the departmentdetails.

Select* from Department

--3. Listall job details.

Select * From Job

--4. Listall the locations.

Select * from Location1

--5. Listout the FirstName,LastName,Salary,Commission for all Employees.

Select First_Name,Last_Name,Salary,Commision from Employee


/*6. Listout the EmployeeID,LastName,Department ID for all employees and
alias
EmployeeIDas"IDof theEmployee",LastNameas"Nameof the
Employee",Department IDas"Dep_id".*/

Select Emp_ID AS Id, Last_Name AS Name,Dept_Id AS DeptId from Employee

--7. Listout the annual salary of the employees with their names only.

Select First_Name,Salary*12 AS AnnualSalary from Employee 


--WHERECondition:
--1. List the details about"Smith".

Select * from Employee where Last_Name='Smith'

--2. List out the employees who are working in department20.

Select* from Employee where Dept_Id=20

--3. List out the employees who are earning salaries between 3000 and 4500.

Select First_Name, Salary from employee where Salary between 3000 and 4500

--4. List out the employees who are working in department 10 or 20.

Select * from Employee where Dept_Id= 10 OR Dept_Id=20

--5. Find out the employees who are notworking in department 10 or 30.

Select * from Employee where Dept_Id NOT IN(10,30)

--6. Listout the employees whose name starts with'S'.
Select * from Employee Where First_Name Like 'S%'

--7. List out the employees whose name starts with 'S' and ends with'H'.

Select * from Employee where First_Name Like 'S%H%'

--8. List out the employees whose name length is 4 and start with'S'.

Select * From Employee Where First_Name Like 'S%' AND Len(First_Name)=4;

/*9. List out employees who are working in department 10 and draw salaries more
than 3500.*/

Select * from Employee Where Dept_Id=10 AND Salary >3500

--10.List out the employees who are not receiving commission.

Select * from Employee Where Commision=0 OR Commision IS NULL

--ORDERBYClause:
/*1. List out the Employee ID and Last Name in ascending order based onthe
Employee ID.*/

Select Emp_ID, Last_Name from Employee Order by Emp_ID ASC

--2. List out the Employee ID and Name in descending order based on salary.

Select Emp_ID, First_Name from Employee Order by Salary Desc

--3. List out the employee details according to their Last Name in ascending-order.

Select * from Employee Order by Last_Name ASC

/*4. List out the employee details according to their Last Name inascending
order and then Department ID in descending order.*/

Select * from Employee Order by Last_Name ASC , Dept_Id DESC;

--GROUPBYandHAVING Clause:
--1. Howmany employees are in different departments in the organization?

Select DeptId, Count(*) AS Total_employee from Department group by DeptID


/*2. List out the department wise maximum salary, minimum salary and
average salary of the employees.*/

Select Dept_Id,MAX(Salary) AS Maximumsalary,MIN(Salary) AS Minimumsalary,AVG(Salary) AS Avaregesalary from Employee Group by Dept_Id

/*3. List out the job wise maximum salary, minimum salary andaverage
salary of the employees.*/

Select Job_Id, MAX(Salary) AS Maximumsalary,MIN(Salary) AS Minimumsalary,AVG(Salary) AS Avaregesalary from Employee Group by Job_Id

--4. List out the number of employees who joined each month in ascendingorder.

Select Month(Hire_Date) AS HireMonth,Count(*) AS NO_Of_Employees from Employee Group by Month(Hire_Date) Order by Month(Hire_Date) ASC

/*5. List out the number of employees for each month and yearin
ascending order based on the year and month.*/

Select Year(Hire_Date) AS Years,Month(Hire_Date) AS Months, Count(*) AS No_Of_Emp from Employee 
Group by Month(Hire_date),Year(Hire_Date)Order by Months,Years ASC

--6. List out the Department ID having at least four employees.

Select Dept_Id from Employee Group by Dept_Id Having Count(*) > = 4;

--7. Howmany employees joined in the month of January?

Select Count(*) AS No_of_Emp from Employee where Month(Hire_Date)=1;

--8. Howmany employees joined in the month of January orSeptember?

Select Count(*) AS No_Of_Emp From Employee where Month(Hire_Date)=1 OR Month(Hire_Date)=9;

--9. Howmany employees joined in 1985?

Select Count(*) AS No_Of_Emp From Employee where Year(Hire_Date)=1985;

--10. How many employees joined each month in 1985?

Select Month(Hire_Date) AS Months,Count(*) AS No_of_Emp from Employee where Year(Hire_Date)=1985 Group by Month(Hire_Date)

--11. How many employees joined in March 1985?

Select Count(*) AS No_of_Emp from Employee Where Month(Hire_Date)=3 AND Year(Hire_Date)=1985

/*12. Which is the Department ID having greater than or equal to 3 employees
joining in April 1985?*/

Select Dept_Id from Employee where Month(Hire_Date)=4 AND Year(Hire_date)=1985 Group by Dept_Id Having Count(*)>=3

--Joins:
--1. List out employees with their department names.

Select Name, E.Dept_ID from Employee AS E Inner join Department AS D ON  E.Dept_Id=D.DeptId

--2. Display employees with their designations.

Select J.Designation,E.Emp_ID from Employee E Inner Join Job J ON E.Job_Id=J.JobId

--3. Display the employees with their department names and regionalgroups.

Select E.Emp_Id,D.Name,L.City from Employee E Join 
Department D ON E.Dept_ID=D.DeptId 
Join Location1 L ON L.LocationId=D.LocationId

/*4. How many employees are working in different departments? Display with
department names.*/
Select D.Name,Count(Emp_Id) AS No_of_Emp from Employee E  Join Department D ON E.Dept_Id=D.DeptId Group by Name

--5. How many employees are working in the sales department?

Select Count(*) AS No_of_Employee from Employee E Join Department D ON E.Dept_Id=D.DeptId where Name='Sales'

/*6. Which is the department having greater than or equal to 5
employees? Display the department names in ascending
order.*/

Select Name from Employee E Join Department D ON E.Dept_Id=D.DeptId Group by Name Having Count(Name)>=5 Order by Name ASC

--7. How many jobs are there in the organization? Display with designations.

Select J.Designation, Count(E.Job_Id) AS No_of_Jobs from Job J Left Join Employee E ON J.JobId=E.Job_Id group by Designation

--8. How many employees are working in "New York"?

Select Count(*) AS No_of_Emp from Department D Join Location1 L ON D.LocationId=L.LocationId Join Employee E ON E.Dept_id=D.DeptId where City='New york' 

/*9. Display the employee details with salary grades. Use conditional statement to
create a grade column.*/
 
Select *,
Case
  When salary < 1000 Then 'Grade D'
  When salary < 1500 Then 'Grade C'
  When Salary < 2000 Then 'Grade B'

  Else 'Grade A'

END AS Grade

From Employee

/*10. List out the number of employees grade wise. Use conditional statementto
create a grade column.*/

Select 

Case
  When salary < 1000 Then 'Grade D'
  When salary < 1500 Then 'Grade C'
  When Salary < 2000 Then 'Grade B'

  Else 'Grade A'

 END AS Grade,
  Count(*) AS No_of_Emp

From Employee 
group by 
Case
  When salary < 1000 Then 'Grade D'
  When salary < 1500 Then 'Grade C'
  When Salary < 2000 Then 'Grade B'

  Else 'Grade A'

END
Order by Grade

/*11.Display the employee salary grades and the number ofemployees
between 2000 to 5000 range of salary.*/

Select
Case 
   when Salary < 1000 Then 'Grade D'
   When Salary < 1500 Then 'Grade C'
   When Salary < 2000 Then 'Grade B'

   Else 'Grade A'

   End AS Grade,

  Count(*) AS No_of_Emp
  From Employee
  Where Salary between 2000 AND 5000 

  Group by
  Case 
   when Salary < 1000 Then 'Grade D'
   When Salary < 1500 Then 'Grade C'
   When Salary < 2000 Then 'Grade B'

   Else 'Grade A'

   End

   Order by Grade


--12.Display all employees in sales or operation departments

Select * from Employee E Join Department D ON D.DeptID= E.Dept_Id where D.Name IN ('Sales', 'Operation')

--SET Operators:

--1. List out the distinct jobs in sales and accounting departments.

Select Distinct J.Designation from Job J Join Employee E ON J.JobId= E.Job_Id JOIN Department D ON E.Dept_Id=D.DeptId where D.Name IN ('Sales','Accounting')

--2. List out all the jobs in sales and accounting departments.

Select D.Name,J.Designation from Job J JOIN Employee E ON J.JobId= E.Job_Id JOIN Department D ON E.Dept_Id=D.DeptId where D.Name IN ('Sales','Accounting')

/*3. List out the common jobs in research and accounting
departments in ascending order.*/


Select J.Designation  from Job J JOIN Employee E ON J.JobId=E.Job_Id JOIN Department D ON E.Dept_Id=D.DeptId where D.Name='Research'

Intersect

Select J.Designation  from Job J JOIN Employee E ON J.JobId=E.Job_Id JOIN Department D ON E.Dept_Id=D.DeptId where D.Name='Accounting' Order by J.Designation ASC


--Subqueries:
--1. Display the employees list who got the maximum salary.

Select Emp_Id,Last_Name, First_Name from Employee where Salary = (Select MAX(Salary) from Employee);

--2. Display the employees who are working in the sales department.

Select Emp_Id, Last_Name, First_Name from Employee where Dept_Id=(Select DeptId from Department where Name= 'Sales')

--3. Display the employees who are working as 'Clerk'.

Select Emp_Id,Last_Name, First_Name from Employee Where Job_Id=(Select JobId from Job where Designation='Clerk')

--4. Display the list of employees who are living in "New York".

Select E.Emp_Id from Employee E where E.Dept_Id=(Select L.LocationId from Location1 L Where L.City='New York')

--5. Find out the number of employees working in the sales department.

Select Count(*) AS No_of_Emp from Employee E where E.Dept_Id=(select D.DeptId from Department D where D.Name='Sales')

/*6. Update the salaries of employees who are working as clerks on the basisof
10%.*/

Update E SET E.salary= E.Salary * 1.10 from Employee E where E.Job_Id=(Select J.JobId from Job J where Designation='Clerk')

--7. Delete the employees who are working in the accounting department

Delete from Employee where Dept_Id=(Select DeptId from Department  Where Name='Accounting')

--8. Display the second highest salary drawing employee details.

Select * from Employee where salary= (Select Min(Salary) from Employee where salary IN (Select Distinct Top 2 Salary from Employee Order by Salary DESC))

--9. Display the nth highest salary drawing employee details.

Declare @Rank Int =5;
With Salaryrank AS        
(
Select Emp_Id,First_Name,Last_Name,Salary,row_number() Over (Order by Salary DESC) AS Rank from Employee
)

Select Emp_Id,First_Name,Last_Name,Salary from Salaryrank where Rank=@Rank;

--10. List out the employees who earn more than every employee in department30.

Select Emp_Id,First_Name, Last_Name, Salary,dept_Id from Employee where salary>(Select Max(salary) from Employee where Dept_Id=30)

/*11. List out the employees who earn more than the lowest salary in
department.Find out whose department has no employees.*/

Select Emp_Id,First_Name,Last_Name, Salary from Employee where Salary>(Select Min(Salary) from Employee)

Select D.DeptId, Name, E.Emp_Id from Department D Left join  Employee E ON E.Dept_Id= D.DeptId Where E.Emp_Id IS NULL

--12. Find out which department has no employees.

Select D.DeptId, Name, E.Emp_Id from Department D Left join  Employee E ON E.Dept_Id= D.DeptId Where E.Emp_Id IS NULL

13. Find out the employees who earn greater than the average salary for
their department

Select Emp_ID, First_Name, Last_Name,Salary from Employee where Salary>(Select Avg(Salary) from Employee)


