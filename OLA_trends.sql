CREATE DATABASE ola;
USE ola;

#1. Retrieve all successful bookings:
CREATE VIEW Successful_Booking AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        booking_status = 'Success';

#Simplify
SELECT * FROM Successful_booking;





#2. Find the average ride distance for each vehicle type:
CREATE VIEW avg_dist_vehicle AS
    SELECT 
        vehicle_type, AVG(ride_distance) AS average_distnace
    FROM
        bookings
    GROUP BY vehicle_type;
    
#Simplify
select * from avg_dist_vehicle;





#3. Get the total number of cancelled rides by customers:
CREATE VIEW canceled_by_customer AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        booking_status = 'canceled by customer';
#Simplify
 select * from canceled_by_customer;
  
  
  
  

 #4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customer AS
    SELECT 
        customer_id, COUNT(booking_id) AS TOTAL_ride
    FROM
        bookings
    GROUP BY customer_id
    ORDER BY total_ride DESC
    LIMIT 5;
    
 #Simplify
SELECT * from top_5_customer;





#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW perosonal_and_car_related_issues_cancelled_rides AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        canceled_rides_by_driver = 'Personal & Car related issues';
        
#Simplify
select * from perosonal_and_car_related_issues_cancelled_rides;





#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_min_rating_for_sedan AS
    SELECT 
        MAX(driver_ratings) AS max, MIN(driver_ratings) AS min
    FROM
        bookings
    WHERE
        vehicle_type = 'Prime Sedan';
        
#Simplify
select * from max_min_rating_for_sedan;





#7. Retrieve all rides where payment was made using UPI:
create view UPI_transcation as 
select * from bookings
where payment_method="UPI";

#Simplify
select * from UPI_transcation;





#8. Find the average customer rating per vehicle type:
CREATE VIEW avg_cust_rating AS
    SELECT 
        vehicle_type, AVG(customer_rating) AS avg_ratings
    FROM
        bookings
    GROUP BY vehicle_type;
#Simplify
select * from avg_cust_rating;





#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW successful_bookings AS
    SELECT 
        SUM(booking_value) AS total_value
    FROM
        bookings
    WHERE
        booking_status = 'successful';
        
#Simplify
select * from successful_bookings;





#10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides AS
    SELECT 
        booking_id, incomplete_rides_reason
    FROM
        bookings
    WHERE
        incomplete_rides = 'Yes';
        
#Simplify
select * from incomplete_rides;