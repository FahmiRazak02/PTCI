Pusat Tuition Cikgu Ibrahim Management System

The Pusat Tuition Cikgu Ibrahim Management System is a Java-based application developed using NetBeans IDE 8.2 and JDK 8u111.
It is designed to manage the operations of a tuition center, including student records, class schedules, and fee management. 
The project uses the NetBeans embedded database for data storage.

-- Installation Instructions

-- Prerequisites

- Java JDK 8u111
- NetBeans IDE 8.2

--- Steps to Set Up the Project Locally

1. *Clone the Repository*
   ```bash
   • git clone https://github.com/FahmiRazak02/PTCI.git

2.  Import the Project into NetBeans
    • Open NetBeans IDE.
    • Click on File > Open Project.
    • Navigate to the cloned repository directory and select the project.
    
3.  Set Up the Database
    • The project uses the NetBeans embedded database (Java DB/Derby). The database script is provided in the repository.
    • Ensure Java DB is configured and started in NetBeans:
      • Go to the Services tab.
      • Right-click on Java DB and select Start Server.
    • Run the provided SQL script to set up the database:
      • The script file is located at database/ptciDBScript.txt.
      • Execute this script within the Java DB environment in NetBeans to create the necessary tables and initial data.
    
4.  Configure Database Connection
    • The database connection should already be configured in the project.
    • Ensure the connection settings match your local setup.
    
--- Usage Instructions

1.  Run the Project
  • Open the project in NetBeans.
  • Ensure that the Java DB server is running.
  • Right-click on the project in the Projects pane and select Run.
  
  2.  Using the Application
  • For Student Login
    • Go to login page
    • insert username: johndoe & password: "fun123"
    • Click "Register Now" and use it to register class and make payment
  • For Admin Login
    • Choose "admin" at login as button
    • insert username: admin & password: "admin123"
    • Use the admin page to manage student, subject management, validate payment and new admin singup

--- Technologies Used

   • Java
   • NetBeans IDE 8.2
   • NetBeans Database (Java DB/Derby) 
  
-- Screenshot
    Landing Page
  ![landing page](https://github.com/FahmiRazak02/PTCI/assets/171445864/12e76b5e-5c44-4762-88c0-f35132cd9d49)
