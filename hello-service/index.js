// index.js
const express = require('express');
const app = express();

// Middleware to parse incoming JSON requests
app.use(express.json());

// Define a route to handle GET requests
app.get('/hello', (req, res) => {
    // Get the name from the query parameters, e.g., /hello?name=Meghana
    const name = req.query.name || 'World';  // Default to 'World' if no name is provided
    res.send(`Hello, ${name}!`);
});

// Start the server on port 3000
const port = 3000;
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
