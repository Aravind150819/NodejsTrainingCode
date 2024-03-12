// integer data type
let a='5';
let b=5;
//String data type 
let string = 'yuga';
//boolean data type 
let boolean = true;
//Double equal and triple equal check 
if(a==b){
    console.log('a and b equal values',a,'and',b);
    if(typeof a==='string'){
        a=10
        console.log('a and b data type is equal',a,typeof b);
    }else{
        console.log('a and b data type is not equal',typeof a,typeof b);
    }
 }
 // Array and object data type 
 
  var array =['name',"Age",`Address`,12]
  console.log('Array values print : ',array[0]);
  var obj ={firstName:"Yugabharathi",lastName:"KS",age:4,School:true};
  console.log('Object value print log : '+obj.firstName+'\n'+obj.School);