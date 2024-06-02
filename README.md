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
   • Landing Page
  ![landing page](https://github.com/FahmiRazak02/PTCI/assets/171445864/12e76b5e-5c44-4762-88c0-f35132cd9d49)
  • Login
  ![login](https://github.com/FahmiRazak02/PTCI/assets/171445864/2906acb8-e056-43f9-8517-9eba9490f8be)
  • Register
  ![register](https://github.com/FahmiRazak02/PTCI/assets/171445864/b2e52e36-213d-43f7-afdc-6d3dae744dd2)
  • Student Homepage
  ![student homepage](https://github.com/FahmiRazak02/PTCI/assets/171445864/b76409d7-7084-4c65-9264-4873f53de4f0)
  • Register Subject  
  ![register subject](https://github.com/FahmiRazak02/PTCI/assets/171445864/7a3a1222-8ae3-4af4-b344-20004476d6f0)
  • Admin Page
  ![admin](https://github.com/FahmiRazak02/PTCI/assets/171445864/3c5a08a5-5dff-4496-9361-08c6db1b8a05)
  • Manage Studentt
  ![student management](https://github.com/FahmiRazak02/PTCI/assets/171445864/03de1efa-d03b-44fe-914d-007537c99907)
  • Manage Subject
  ![subject management](https://github.com/FahmiRazak02/PTCI/assets/171445864/c8e77759-1d79-41a3-bb4f-3e36c46db03c)
  • Validate Payment
  ![validate payment](https://github.com/FahmiRazak02/PTCI/assets/171445864/592aa980-1865-4b53-90af-56a645180067)
