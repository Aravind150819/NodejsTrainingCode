const express =require("express")
const router = express.Router();
//MongoDB modules use 
const mongoDB =require("mongodb")

var MongoClient = mongoDB.MongoClient;
var url ="mongodb://localhost:27017"
var db
MongoClient.connect(url,(err,con)=>{
    if(err)console.log(err);
    db = con.db('ProductDetail')//ProductDetail is DB name
})

//get the all values in MongoDB
router.get("/productDetails",(req,res)=>{
    db.collection("products").find({}).toArray(function(err,result){
        if(err)console.log(err);
        res.send(result);
    })
 })

module.exports = router;