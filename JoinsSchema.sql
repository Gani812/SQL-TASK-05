#USE EXISTING DATABASE
USE RentalDB;

#INNER JOIN: Show Booking Details with Renter and Property Info
SELECT B.BookingID, R.Name AS RenterName, P.Title AS PropertyTitle, B.StartDate, B.EndDate
FROM Bookings B
INNER JOIN Renters R ON B.RenterID = R.RenterID
INNER JOIN Properties P ON B.PropertyID = P.PropertyID;

#LEFT JOIN: Show All Properties and Their Booking Details
SELECT P.PropertyID, P.Title AS PropertyTitle, B.BookingID, B.StartDate
FROM Properties P
LEFT JOIN Bookings B ON P.PropertyID = B.PropertyID;

#RIGHT JOIN: Show All Bookings and Their Property (if exists) – only works in MySQL
SELECT B.BookingID, P.Title AS PropertyTitle, B.StartDate
FROM Bookings B
RIGHT JOIN Properties P ON B.PropertyID = P.PropertyID;

#FULL OUTER JOIN: All Properties and Bookings (using UNION)
SELECT P.PropertyID, P.Title AS PropertyTitle, B.BookingID, B.StartDate
FROM Properties P
LEFT JOIN Bookings B ON P.PropertyID = B.PropertyID
UNION
SELECT P.PropertyID, P.Title AS PropertyTitle, B.BookingID, B.StartDate
FROM Properties P
RIGHT JOIN Bookings B ON P.PropertyID = B.PropertyID;

#MULTI JOIN: Owners with Their Properties and Location Info
SELECT O.Name AS OwnerName, P.Title AS PropertyTitle, L.City
FROM Owners O
JOIN Properties P ON O.OwnerID = P.OwnerID
JOIN Locations L ON P.LocationID = L.LocationID;

#JOIN Renters with Payment Info via Booking Table
SELECT R.Name AS RenterName, PM.PaymentDate, PM.AmountPaid, PM.PaymentMethod
FROM Renters R
JOIN Bookings B ON R.RenterID = B.RenterID
JOIN Payments PM ON B.BookingID = PM.BookingID;

#JOIN to Find Total Rent Collected Per City
SELECT L.City, SUM(P.RentAmount) AS TotalRent
FROM Properties P
JOIN Locations L ON P.LocationID = L.LocationID
GROUP BY L.City;

#JOIN to Count Bookings per Renter
SELECT R.Name AS RenterName, COUNT(B.BookingID) AS TotalBookings
FROM Renters R
LEFT JOIN Bookings B ON R.RenterID = B.RenterID
GROUP BY R.Name;

#JOIN to Get Average Rent by City
SELECT L.City, ROUND(AVG(P.RentAmount), 2) AS AvgRent
FROM Properties P
JOIN Locations L ON P.LocationID = L.LocationID
GROUP BY L.City;

#JOIN to Get Total Payment Collected by Payment Method
SELECT PM.PaymentMethod, SUM(PM.AmountPaid) AS TotalCollected
FROM Payments PM
GROUP BY PM.PaymentMethod;
