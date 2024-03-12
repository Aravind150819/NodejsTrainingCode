const webServer =require('http')
const port =4000

//create webServer
webServer.createServer(function(req,res){
    res.write("wellcome to node.js web")
    res.end();
}).listen(port,(err)=>{
    if(err){
        return console.log("Web server is error")
    }else{
        console.log(`server is go ${port}!`)
    }
})
