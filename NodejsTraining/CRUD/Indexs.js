var mongo =require('mongodb').MongoClient;
//var url ="mongodb://localhost:27017/pd"
console.log("enter in MongoDB");
 mongo.connect("mongodb://0.0.0.0:27017/pd",(err,client)=>{
    console.log("enter in MongoDB");
    if(err) throw err;
    
    console.log("enter in MongoDB");
    client.close();
 });

 //exit 
 process.on('uncaughtException',err=>{
   console.error(`there was an uncaught error : ${err}`)
   process.exit(1)
 })