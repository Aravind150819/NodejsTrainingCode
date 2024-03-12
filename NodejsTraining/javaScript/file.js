const path = require('path')
const fsPromises =require('fs').promises;
const funOpen = async()=>{
    try{
        const data =await fsPromises.readFile(path.join(__dirname,'start.txt'),'utf8')
        console.log(data)
        await fsPromises.writeFile(path.join(__dirname,'Thank.txt')," Thank you")
        console.log('writeFile complete')
        await fsPromises.appendFile(path.join(__dirname,'Thank.txt'),'\n End of the data')
        console.log('appendFile complete')

    }catch(err){
        console.error('file system error : ',err)
    }
}
funOpen()

//exit 
process.on('uncaughtException',err=>{
    console.error(`there was an uncaught error : ${err}`)
    process.exit(1)
  })