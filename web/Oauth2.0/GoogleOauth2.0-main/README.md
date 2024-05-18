# Google OAuth 2.0 with JavaScript

---

Open Authentication [OAuth](https://oauth.net/2/) is an open-standard authorization protocol or framework that provides applications the ability for “secure designated access.” It is a way for users to grant websites or applications access to their information without giving away their passwords.

This README.md file provides a step-by-step guide on implementing Google OAuth 2.0 authentication using JavaScript for your web application(s). Google OAuth 2.0 allows users to sign in to your application using their Google credentials.

Prerequisites
Before you begin, make sure you have the following:

> Google Developer Console project with OAuth 2.0 credentials.
> A web server to host your application.
> Basic knowledge of HTML, CSS, and JavaScript.

# Steps

## 1. Create a Project in Google Developer Console

Go to the [Google Developer Console](https://console.cloud.google.com)
Create a new project or select an existing one.
For this example let us name it Google OAuth Example. Make sure to select the project so that a left sidebar appears in your window.

## 2. Enable Google API

In the dashboard, click on **_APIs & Services_** and then **_Dashboard_**.
Click on the **_+ ENABLE APIS AND SERVICES_** button.
![Create Credentials](/public/Google%20OAuth%202.0/Enable%20APIs%20and%20services.png)
Scroll through till you find **_Google+ API_** and enable it.
![Create Credentials](/public/Google%20OAuth%202.0/Google+%20API.png)

## 3. Create OAuth 2.0 Credentials

In the left sidebar, navigate to **_Credentials_**.
Click on **_Create Credentials_** and choose **_OAuth client ID_**.
![Create Credentials](/public/Google%20OAuth%202.0/create%20credentials.png)

> In case you haven't already, you may be prompted to create your **_OAuth Consent Screen_**. I found these params to work well for the OAuth Consent Screen.
> i. User type - External
> ii. App name - Google OAuth Example
> iii. User Support Email - "Your email here"
> iv. App logo - _Optional_
> v. App domain - _Optional_
> vi. Developer Contact Information - "Your email here"
> vii. Scopes and permissions - _Optional_
> viii. Test Users - Add 1 or more email addresses for testing
> ix. Scroll down to **_Back to Dashboard_** and publish the app (make it available to any gmail address)

Set application type to **_Web application_**.

Add the authorized JavaScript origins and redirect URIs for your project, for example:
Application type* = Web Application
Name* = Web Client 1
Authorised JavaScript origins URIs = http://localhost:3000
Authorised redirect URIs = http://localhost:3000

## 4. Obtain Client ID

Once created, your **_client ID and client secret_** will be displayed.
Copy and Save both of these in your .env to be called in your code.

```bash
    /.env
GOOGLE_CLIENT_ID =
GOOGLE_CLIENT_SECRET =
```

NB// your **.env** files should always be in **.gitignore**!!
Happy Coding <3
