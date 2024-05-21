// Importing the http module
const http = require('http');

// Creating a server instance
const server = http.createServer((req, res) => {
    // Handling incoming requests
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello, World!\n');
});

// Specifying the port number
const port = 3000;

// Starting the server, listening on the specified port
server.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});