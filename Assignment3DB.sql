

--1: Create a user-defined function to stuff 'Chicken' into 'Quick Bites'

Create Function Fn_StuffintoReplace (@Replace Varchar(250))
Returns Varchar(250)
AS
Begin

DECLARE @Replaceword Varchar(250);
Set @Replaceword =Replace(@Replace,'Chicken','Quick Bites');
Return @Replaceword;
End


--Output

SELECT dbo.Fn_StuffintoReplace('I like Chicken') AS Result;






