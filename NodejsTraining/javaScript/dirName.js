console.log("dirname :",__dirname)
console.log("filename :",__filename)
console.log("-------")
const path= require('path')
console.log("Project file path : ",path.dirname(__filename))
console.log("base name : ",path.basename(__filename))
console.log("Ext name : ",path.extname(__filename))
console.log("Parse : ",path.parse(__filename))

console.log("-------")
//const math =require('./airfunction')
const {add} =require('./airfunction')
//mjs file models
//import {add} from './airfunction.js' run common is node dirName.mjs
console.log("add : ",add(3,3))
/*console.log("sub : ",math.sub(3,3))
console.log("mul : ",math.mul(3,3))
console.log("div : ",math.div(7,2))
console.log("per : ",math.per(7,2))*/
