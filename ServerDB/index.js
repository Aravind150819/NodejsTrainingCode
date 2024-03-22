const express = require("express");
const mongoose =require("mongoose");
const port = 4000;
const app =express();

mongoose.connect('mongodb://127.0.0.1:27017/pd');

const userSchema = new mongoose.Schema({
    mobileName: String,
    price: Number
})

const userModel = mongoose.model("priceList",userSchema);

app.get("/",(req,res)=>{
    userModel.find({}).then(function(priceList){
        res.json(priceList)
    }).catch(function(err){
        console.error(err)
    })
}).listen(port,()=>{
    console.log(`server is connection is successful Port:${port}`)
});