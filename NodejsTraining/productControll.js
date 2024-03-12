const express = require("express");
const router = express.Router();

var products =[
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

var product =[
    { "id":0o1,
      "mobile":"OnePlus",
      "ModuleName":"11R",
      "price":38999
    },]

router.get("/", function (req, res) {
  res.send("Hello World!");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
});

router.get("/products", function (req, res) {
  res.send(products);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
});

router.get("/products/1", function (req, res) {
    res.send(product);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  });

  module.exports = router;
