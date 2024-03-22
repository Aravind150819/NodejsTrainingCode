const express =require('express');
const mongo = require('mongodb');
const app = express();
var MongoClient = mongo.MongoClient;

let database;

async function getDatabase(){
    const client = await MongoClient.connect('mongodb://127.0.0.1:27017');
    database = client.db('pd');

    if(!database){
        console.log("dataBase not connect");
    }else{
    console.log('database connect successful');
}
    return database ;
}

app.get('/',async(req,res)=>{
    let dbo =  await getDatabase();
    let collection = await dbo.collection('price').find({name:"Aravind"}).toArray();
    //let alldata = await collection.find({name:"Aravind"}).toArray();
    res.send(collection);
    console.log(collection)
}).listen(4000,(err)=>{
    console.log('serve is done port : 4000');
});

//exit 
process.on('uncaughtException',err=>{
    console.error(`there was an uncaught error : ${err}`)
    process.exit(1)
  })