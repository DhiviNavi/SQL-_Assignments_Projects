/*Data Cleaning
Before analysis, the dataset will undergo a thorough cleaning process to address issues such
as:*/

/*Handling missing values in critical columns (e.g., fare, ride_id, population).
Resolving duplicate records.*/

Select * from [dbo].[rides_dataset1]
Select * from [dbo].[payment_dataset4]
Select * from [dbo].[driver_dataset3]
Select * from [dbo].[city_dataset2]

UPDATE Payment_dataset4
SET fare = 0
WHERE fare IS NULL;

UPDATE city_dataset2
SET Population = 0
WHERE Population IS NULL;

DELETE FROM dbo.rides_dataset1
WHERE ride_id IS NULL;


● Ensuring data consistency across tables (e.g., matching driver ratings with actual ride
data).


Select * from [dbo].[rides_dataset1]
Select * from [dbo].[driver_dataset3]


SELECT 
    r.ride_id,
    r.driver_id,
    r.rating AS ride_rating,
    d.avg_driver_rating AS driver_avg_rating
FROM [dbo].[rides_dataset1] r
JOIN [dbo].[driver_dataset3] d ON r.driver_id = d.driver_id
WHERE r.rating <> d.avg_driver_rating;

--Capstone Project Questions (SQL-Based)

/*City-Level Performance Optimization

Which are the top 3 cities where Uber should focus more on driver recruitment based on key
metrics such as demand high cancellation rates and driver ratings?*/

SELECT TOP 3
    c.city_name,
    COUNT(r.ride_id) AS total_rides,
    SUM(CASE WHEN r.ride_status = 'Canceled' THEN 1 ELSE 0 END) AS total_cancellations,
    AVG(d.avg_driver_rating) AS avg_driver_rating
FROM [dbo].[rides_dataset1] r
JOIN [dbo].[city_dataset2] c ON r.start_city = c.city_name
JOIN [dbo].[driver_dataset3] d ON r.driver_id = d.driver_id
GROUP BY c.city_name
ORDER BY total_rides DESC, total_cancellations DESC, avg_driver_rating ASC;


Select * from [dbo].[rides_dataset1]

Select * from [dbo].[city_dataset2]

/*Revenue Leakage Analysis
How can you detect rides with fare discrepancies or those marked as "completed" without any
corresponding payment?*/


Select * from [dbo].[rides_dataset1]
Select * from [dbo].[payment_dataset4]

Select Ride_Id,Ride_Status, Fare from [dbo].[rides_dataset1] where ride_status='Completed' AND Payment_Method IS Null

-- Fare mismatch
SELECT r.ride_id, r.fare
FROM [dbo].[rides_dataset1] r
JOIN [dbo].[payment_dataset4] p ON r.ride_id = p.ride_id
WHERE r.fare <> p.fare;

/*Cancellation Analysis
What are the cancellation patterns across cities and ride categories? How do these patterns
correlate with revenue from completed rides?*/

Select * from [dbo].[rides_dataset1]
Select * from [dbo].[city_dataset2]
Select * from [dbo].[payment_dataset4]


SELECT 
    c.city_name,
      SUM(p.Fare) AS total_revenue
FROM [dbo].[rides_dataset1] r
JOIN [dbo].[payment_dataset4] p ON r.ride_id = p.ride_id
JOIN [dbo].[city_dataset2]c ON r.start_city = c.city_name
WHERE r.ride_status = 'Completed'
GROUP BY c.city_name


/*Cancellation Patterns by Time of Day
Analyze the cancellation patterns based on different times of day. Which hours have the highest
cancellation rates, and what is their impact on revenue*/

SELECT 
    DATEPART(HOUR, r.start_time) AS ride_hour,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN r.ride_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_rides,
    ROUND(
        100.0 * SUM(CASE WHEN r.ride_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS cancellation_rate_pct,
    SUM(CASE WHEN r.ride_status = 'Completed' THEN p.fare ELSE 0 END) AS revenue
FROM [dbo].[rides_dataset1] r
LEFT JOIN [dbo].[payment_dataset4] p ON r.ride_id = p.ride_id
GROUP BY DATEPART(HOUR, r.start_time)
ORDER BY cancellation_rate_pct DESC;