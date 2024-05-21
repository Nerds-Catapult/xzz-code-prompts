# Simple Lightweight Server using Node.js

This repository contains a simple example of setting up a lightweight server using Node.js. This server responds with a "Hello, World!" message to incoming HTTP requests.

## Prerequisites

Before running the server, ensure that you have Node.js installed on your system. You can download and install Node.js from [nodejs.org](https://nodejs.org/).

## Getting Started

To get started with this server:

1. Clone this repository to your local machine or download the files directly.
2. Navigate to the project directory in your terminal or command prompt.

## Running the Server

To run the server, follow these steps:

1. Open your terminal or command prompt.
2. Navigate to the directory where you cloned/downloaded the repository.
3. Run the following command:

```bash
node server.js
```

4. Once the server is running, you should see a message indicating that the server is running at `http://localhost:3000/`.

## Accessing the Server

You can access the server by navigating to `http://localhost:3000/` in your web browser. You should see a "Hello, World!" message displayed in plain text.

## Understanding the Code

The `server.js` file contains the code for setting up the server. Here's a brief overview of what each part of the code does:

- Import the `http` module provided by Node.js.
- Create a server instance using `http.createServer()`, defining a callback function to handle incoming requests.
- Inside the callback function, set the status code of the response to 200 (OK), set the content type to plain text, and send the response body with the text "Hello, World!".
- Specify the port number the server should listen on (in this case, 3000).
- Start the server by calling the `listen()` method on the server instance.
