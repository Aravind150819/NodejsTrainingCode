const express = require("express");
const app = express();
const port = 3000;

var product =[
  { "id":0o1,
    "mobile":"OnePlus",
    "ModuleName":"11R",
    "price":38999
  },
  { "id":0o2,
    "mobile":"OnePlus",
    "ModuleName":"11",
    "price":50000
  },
  { "id":0o3,
    "mobile":"OnePlus",
    "ModuleName":"12",
    "price":45000
  },
]
app.get("/", function (req, res) {
  res.send("Hello World!");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
});

app.get("/products", function (req, res) {
  res.send(product);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
});

app.listen(port, function () {
  console.log(`Example app listening on port ${port}!`);
});