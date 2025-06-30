# SQL Internship - Task 5: SQL Joins (MySQL)

# About the Task
In this task, I focused on learning and applying different types of SQL JOINs to combine and analyze data from multiple related tables. The goal was to understand how to use `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, and `FULL OUTER JOIN` effectively, along with multi-table joins for real-world scenarios.

# Database Used
I used the **RentalDB** database, which manages data for a rental property system. The schema includes the following tables:

- `Locations`: City and state details for properties
- `Owners`: Information about property owners
- `Properties`: Listings of rental properties
- `Renters`: Information about individuals renting properties
- `Bookings`: Records of which renter booked which property and when
- `Payments`: Payment records linked to bookings

These tables are connected through foreign key relationships, making them ideal for practicing joins.

# What I Did
As part of this task, I wrote SQL queries using various types of joins to retrieve meaningful combined data. Key highlights of what I worked on:

- Using `INNER JOIN` to get booking details along with property and renter info
- Applying `LEFT JOIN` to show all properties, even if not booked
- Demonstrating `RIGHT JOIN` to show all bookings even if property details are missing (MySQL only)
- Simulating `FULL OUTER JOIN` using `UNION` since it's not directly supported in MySQL
- Performing multi-table joins to connect owners to their properties and the cities they're located in
- Joining renters with their payment information via bookings
- Summing total rent collected by city
- Counting total bookings made by each renter
- Calculating average rent grouped by city
- Summing up total payments received grouped by payment method

These queries helped me understand how to retrieve and analyze connected data across multiple tables — an essential skill for SQL developer.

# Tools Used
- MySQL Workbench

# Files Included
- `JoinsSchema.sql` – Contains all the SQL JOIN queries written for this task
- `README.md` – This file, summarizing the task objectives and learnings
