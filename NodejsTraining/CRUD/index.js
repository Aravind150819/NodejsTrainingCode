const express =require("express")
const port =4000;
const app = express();
const mongo =require("mongodb")
const MongoClient=mongo.MongoClient;
const bodyParser =require("body-parser")
// Parses the text as url encoded data
app.use(bodyParser.urlencoded({ extended: true }));
 // Parses the text as json
app.use(bodyParser.json());

//Db Connect
const DbUrl ="mongodb://0.0.0.0:27017";
const dbName ="pd";
var dbConnect;
MongoClient.connect(DbUrl,(err,con)=>{
  if(err)console.log(err);
  dbConnect =con.db(dbName);
  console.log("db connect successfull")
})

//get all values
  app.get("/",(req,res)=>{
  dbConnect.collection('priceList').find({}).toArray(function(err,result){
      if(err)console.log("table get values is error :",err);

      console.log("Db values get mentod Successful")
      res.send(result);
    })
  })
  app.listen(port, function () {
    console.log(`Example app listening on port ${port}!`);
  });