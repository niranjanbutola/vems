# Vulnerable Employee Management System (VEMS)
## Introduction
VEMS is a deliberately created vulnerable application which can be used to learn and perform different web based attacks. It is a JAVA based web application using Java Server Pages (JSP) as server side scripting language and Oracle XE as database. 

Following are the web attacks that can be performed in VEMS:-
* SQL Injection
* Cross Site Scripting (XSS)
* Clickjacking
* Session Hijacking
* Privilege Escalation 
* Authorization Bypass
* Authentication Bypass
* HTTP Response Splitting
* Cross Site Request Forgery (CSRF) 
* Invalidated Redirect & Forward
* Improper Error Handling
* Directory Listing
* Path Traversal
* Insecure Direct Object Reference


## User Roles 
VEMS 1.0 consist of three different type of users
* Super Admin
* Admin
* User

**Super Admin**: -  This user has highest level of privilege and can perform following operations:-

* **Profile**
 * View Own Profile
 * Edit Own Profile
 * Change Own Password
 * Change Own Security Question
 * Upload Own Profile Pic
* **Users**
 * Assign Project to a User
 * Un-Assign Project to a User
 * View All User
 * View Other User
 * Edit Other User
* **Projects**
 * Add Project 
 * View All Project
 * View Specific Project
 * Edit Project Details
* **Dashboard**
 * Grant Access to User
 * Revoke Access from User
 * Reset Other User’s Password 
* **Sign Out**

**Admin**: - This is an admin user and can perform following operations:-   
* **Profile**
 * View Own Profile
 * Edit Own Profile
 * Change Own Password
 * Change Own Security Question
 * Upload Own Profile Pic
* **Users**
 * Assign Project to a User
 * Un-Assign Project to a User
 * View All User
 * View Other User
 * Edit Other User
* **Projects**
 * Add Project 
 * View All Project
 * View Specific Project
 * Edit Project Details
* **Sign Out**

**User**: - This user has least privilege and can perform following operations:-    
* **Profile**
 * View Own Profile
 * Edit Own Profile
 * Change Own Password
 * Change Own Security Question
 * Upload Own Profile Pic
* **Sign Out**

## Database Structure
VEMS 1.0 consist of three tables
* **Users**
 * Username
 * Email
 * password
 * firstname 
 * lastname 
 * contactnumber
 * mailingaddress
 * securityquestion
 * securityanswer
 * profilepic
 * role
 * status
* **Projects**
 * projectId
 * ProjectName
 * Start Date
 * enddata
* **UserProjectMapping**
 * username
 * projectId

## Configuration
* Run following database queries before running the application:- 
 * create table users (username varchar2(100),email varchar2(100),password varchar2(100),firstname varchar2(100),lastname varchar2(100),contactnumber varchar2(100),mailingaddress varchar2(100),securityquestion varchar2(100),securityanswer varchar2(100),profilepic varchar2(100),role varchar2(100),status varchar2(50))
 * create table projects (projectid varchar2(100),projectname varchar2(100),startdate varchar2(100),enddate varchar2(100))
 * create table UserProjectMapping (username varchar2(100),projectid varchar2(100))
* Update the deployment descriptor (web.xml) file as per your database configuration. It can be found inside WEB-INF folder. Default values are :-  
 * dbUserName = hr
 * dbPassword = asdf
 * jdbcDriver = oracle.jdbc.driver.OracleDriver
 * urlString = jdbc:oracle:thin:@localhost:1521:XE
* All external libraries can be found in WEB-INF/lib folder.
* All images (Profile Pic) will get uploaded in upload directory.

**NOTE:-** To use this application, user first need to create a “Super Admin” account manually. This can be done easily using above given SQL queries. 

**NOTE:-**  For successful login value for status column should be “1”.

**NOTE:-** While creating super admin account value for role column should be “Super Admin”. 

**NOTE:-** SQL backup can be found in “sql backup” folder.













