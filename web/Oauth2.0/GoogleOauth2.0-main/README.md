Google OAuth 2.0 with JavaScript
This README.md file provides a step-by-step guide on implementing Google OAuth 2.0 authentication using JavaScript for your web application. Google OAuth 2.0 allows users to sign in to your application using their Google credentials.

Prerequisites
Before you begin, make sure you have the following:

Google Developer Console project with OAuth 2.0 credentials.
A web server to host your application.
Basic knowledge of HTML, CSS, and JavaScript.
Steps
1. Create a Project in Google Developer Console
Go to the Google Developer Console.
Create a new project or select an existing one.
2. Enable Google API
In the dashboard, click on "APIs & Services" and then "Dashboard".
Click on the "+ ENABLE APIS AND SERVICES" button.
Search for "Google+ API" and enable it.
3. Create OAuth 2.0 Credentials
In the left sidebar, navigate to "APIs & Services" > "Credentials".
Click on "Create Credentials" and choose "OAuth client ID".
Select "Web application" as the application type.
Add the authorized JavaScript origins and redirect URIs for your project.
4. Obtain Client ID
Once created, your client ID and client secret will be displayed.
Note down the client ID as you'll need it in your JavaScript code.
