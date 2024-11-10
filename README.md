# Pusat Tuition Cikgu Ibrahim Management System
A Java-based application developed in NetBeans, designed to manage operations at a tuition center, including student records, subject registration, payment validation, and administration of class offerings.

##Table of Contents
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Screenshot](#screenshot)
  
## Features
1.   **Student Management**:
      -Register new students and maintain student information within the system.
     
2.   **Subject Management**:
      -add, view, and manage subject offerings, allowing students to select and register for classes.
     
3.   **Payment Validation**:
      -Track and validate student payments for registered classes.
     
4.   **Registration and Enrollment**:
      -Students can register for new subjects and complete payments through the system.

5.   **Admin Management**:
      -Manage student records, subject offerings, payment validation, and new admin registrations.

## Tech Stack

- **Java**: JDK 8u111
- **JNetBeans IDE**: 8.2
- **Database**: NetBeans Embedded Database (Java DB/Derby)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/slmsystem.git
   cd slmsystem
   ```

2. Set up the database:
   - Configure MySQL with a new database and update the connection details in `src/main/resources/application.properties`.

3. Build and run the application:
   ```bash
   mvn spring-boot:run
   ```

4. Open a browser and go to `http://localhost:8080` to access the application.


## Installation

1.   Prerequisites
      -Java JDK 8u111
      -NetBeans IDE 8.2

     
## Steps to Set Up the Project Locally

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
    
##Usage Instructions

1.  **Run the Project**
  • Open the project in NetBeans.
  • Ensure that the Java DB server is running.
  • Right-click on the project in the Projects pane and select Run.
  
  2.  **Using the Application**
  • For Student Login
    • Go to login page
    • insert username: johndoe & password: "fun123"
    • Click "Register Now" and use it to register class and make payment

  • For Admin Login
    • Choose "admin" at login as button
    • insert username: admin & password: "admin123"
    • Use the admin page to manage student, subject management, validate payment and new admin singup
    
## Default Credential
      **Student Login**:
      -Username: johndoe
      -Password: fun123
      
      **Admin Login**:
      -Username: admin
      -Password: admin123
      

## Usage

**Student Functions**:
   -Class Registration: Students can view available subjects and register.
   -Payment: Make payments for registered subjects.
   -Admin Functions:

**Manage Students**: Add or edit student records.
   -Subject Management: Update subject listings.
   -Payment Validation: Approve or review student payments.

## License

This project is licensed under the UITM.

---

Screenshot

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
