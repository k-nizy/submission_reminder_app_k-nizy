Submission Reminder App
This application is designed to alert students about upcoming assignment deadlines. It is built using shell scripting and automates the process of checking student submissions and sending reminders.

Table of Contents
Installation

Execution

Directory Structure

Files Overview

Learning Objectives

Contributing

Installation
Clone the repository:


git clone https://github.com/yourUsername/submission_reminder_app_yourUsername.git
Navigate to the project directory:


cd submission_reminder_app_yourUsername
Run the create_environment.sh script to set up the environment:


./create_environment.sh
Follow the prompts to enter your name. This will create a directory named submission_reminder_yourName.

Execution
Navigate to the created directory:


cd submission_reminder_yourName
Run the application:


./startup.sh
The application will display the assignment details and a list of students who have not submitted their assignments.

Directory Structure
The application directory structure is as follows:


submission_reminder_yourName/
├── config/
│   └── config.env               # Configuration file for the application
├── modules/
│   └── functions.sh             # Helper functions for the application
├── assets/
│   └── submissions.txt          # File containing student submission records
├── reminder.sh                  # Main script to check submissions
└── startup.sh                   # Script to start the application
Files Overview
1. create_environment.sh
This script sets up the directory structure and populates it with the necessary files.

It also makes all required scripts executable.

2. config/config.env
Contains configuration variables for the application:


ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
3. modules/functions.sh
Contains the check_submissions function, which reads the submissions.txt file and identifies students who have not submitted their assignments.

4. assets/submissions.txt
Contains student records in the following format:


student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
...........
5. reminder.sh
The main script that sources the configuration and functions, then checks submissions and displays reminders.

6. startup.sh
A script to start the application. It simply calls the reminder.sh script.

Learning Objectives
This project is designed to help you achieve the following learning objectives:

Master Shell Scripting Basics:

Develop proficiency in writing and executing shell scripts to automate tasks such as directory creation, file manipulation, and application initialization.

Learn essential shell commands and scripting techniques to manage files and directories effectively.

Understand Application Directory Structures:

Learn how to design and implement a logical directory structure for a real-world application.

Understand the importance of organizing files into appropriate directories for better maintainability and scalability.

Develop Problem-Solving and Debugging Skills:

Enhance your ability to troubleshoot and debug scripts by testing your implementation and resolving errors.

Learn to interpret script outputs and refine your code to meet the assignment requirements.

Gain Experience with Version Control and Documentation:

Practice using version control systems to manage and submit your work.

Learn to write clear and concise documentation to explain how to set up and run your application.

Build a Functional Application from Scratch:

Learn how to integrate multiple components to create a working application.

Understand how to automate the setup and execution of an application, simulating a real-world development workflow.

Contributing
If you would like to contribute to this project, follow these steps:


Create a new branch for your feature or bugfix:

git checkout -b feature-name
Commit your changes:


git commit -m "Add your message here"
Push to the branch:

git push origin feature-name
Open a pull request and describe your changes.
