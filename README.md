Hotel Management System

A Java-based Desktop Hotel Management System developed using Java Swing and MySQL, designed to manage hotel operations such as room management, customer check-in/check-out, billing, and user authentication.
This project provides a simple and user-friendly GUI for hotel staff to efficiently handle daily hotel activities.

Features

🔐 User Authentication
Login system with username & password
New user registration (Sign Up)
Password visibility toggle

🏨 Room Management
Add new rooms (AC / Non-AC)
Bed type selection (Single / Double)
Room pricing
Automatic room availability status (Booked / Not Booked)

🧾 Customer Check-In
Store customer details (Name, Gender, Aadhar, Mobile, Email, Address)
Auto-assign available rooms based on selection
Auto-fill check-in date
Price fetched dynamically from room details

🚪 Customer Check-Out
Search customer using room number
Auto-calculate number of days stayed
Generate total bill
Update room status after checkout

💰 Billing System

View customer billing history
Print bill with complete customer & stay details

🖥️ Desktop GUI
Attractive and interactive Java Swing interface
Easy navigation between modules

🛠️ Technologies Used
Programming Language: Java
GUI Framework: Java Swing
Database: MySQL
JDBC: MySQL Connector (JDBC)
IDE: NetBeans / VS Code
Platform: Windows Desktop Application

🗂️ Project Modules
Login
Sign Up
Home Dashboard
Manage Room
Check In
Check Out
Bill Management & Print Bill
Each module is implemented using separate Java classes for better code organization and maintainability 
HOTEL MANAGEMENT SYSTEM PROJECT

.

🧑‍💻 Database Structure
Database Name: dreemhotel
Main Tables:
login – User authentication details
manageroom – Room information & status
customer – Customer stay and booking details
MySQL is connected using JDBC with proper validation and prepared statements to avoid errors and duplication.

▶️ How to Run the Project
Install Java JDK
Install MySQL Server
Create database dreemhotel
Import required tables
Update database credentials in Java files:
jdbc:mysql://localhost:3306/dreemhotel
username: root
password: 12345


Open project in NetBeans / VS Code
Run login.java

📸 Screenshots

Login Page
Home Dashboard
Manage Room
Check In
Check Out
Bill Generation
(All screenshots are included in the project PDF) 
HOTEL MANAGEMENT SYSTEM PROJECT

🎯 Use Case

This project is ideal for:
College / University Mini & Major Projects
Java Swing practice
Database connectivity (JDBC)
Desktop-based management systems