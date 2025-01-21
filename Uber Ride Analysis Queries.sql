create database uber;
use uber;
#1. Retrieve all successful bookings:
create view Successful_Booking as
select * from bookings where  
Booking_Status="Success";

select * from Successful_Booking;

#2. Find the average ride distance for each vehicle type:
create view average_ride_distance_by_vehicle_type as
select Vehicle_Type, avg(Ride_Distance) as Average_ride_Distance from bookings
group by Vehicle_Type;

select * from average_ride_distance_by_vehicle_type;

#3. Get the total number of cancelled rides by customers:
create view NoofRides_Canceled_by_Customers as 
select count(*) from bookings 
where Booking_Status="Canceled by Customer";

select * from NoofRides_Canceled_by_Customers;

#4. List the top 5 customers who booked the highest number of rides:
create view Customer_With_Highest_Rides as
select Customer_ID,count(Booking_ID)as total_rides from bookings
group by Customer_ID order by total_rides desc limit 5;

select* from Customer_With_Highest_Rides;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Cancelledby_Driver_dueto_personal_and_carissues as
select count(*) from bookings where Canceled_Rides_by_Driver="Personal & Car related issue";

select* from Cancelledby_Driver_dueto_personal_and_carissues;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view  Ratings_by_Vehicle_type as
select Vehicle_Type, max(Driver_Ratings),min(Driver_Ratings) from bookings
 group by Vehicle_Type;

select * from Ratings_by_Vehicle_type;
drop view  Ratings_by_Vehicle_type ;
#7. Retrieve all rides where payment was made using UPI:
create view Payment_Method_UPI as
select * from bookings 
where Payment_Method="UPI";

select * from Payment_Method_UPI;

#8. Find the average customer rating per vehicle type:
create view Average_Customer_rating as
select Vehicle_Type , avg(Customer_Rating) as Customer_ratings from bookings
group by Vehicle_Type;

select * from Average_Customer_rating;

#9. Calculate the total booking value of rides completed successfully:
create view Booking_Value_Sum as
select sum(Booking_Value) from bookings where Booking_Status="Success";

select * from Booking_Value_Sum;

#10. List all incomplete rides along with the reason:
create view  Incomplete_Ride_with_reason as
select Booking_ID, Incomplete_Rides_Reason from bookings
where Incomplete_Rides="Yes";

select * from Incomplete_Ride_with_reason;