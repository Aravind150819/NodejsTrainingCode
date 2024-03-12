const express = require('express');
const path = require('path');
const app = express();
const port =2024;

app.use(express.static(path.join(__dirname, 'Public')));

app.get('/', async(req, res) => {
    res.sendFile(path.join(__dirname, 'Public', 'index.html'));
});

app.listen(port, () => {
    console.log("Server successfully running on port 2024");
  });