const path =require('path')
const fs =require('fs')
const rs = fs.createReadStream(path.join(__dirname,'start.txt'),{encoding: 'utf8'})
const ws = fs.createWriteStream(path.join(__dirname,'newStart.txt'))


//one va
/* rs.on('data',(dataChunk)=>{
    ws.write(dataChunk)
})
 */
//other va
rs.pipe(ws)