const express = require("express");
const app = express();
const port = 3000;

const proControll =require('./productControll');

app.use('/proApi',proControll);

  app.listen(port, function () {
    console.log(`Example app listening on port ${port}!`);
  });