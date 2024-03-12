//Console log Method 
console.log('String');// DataType String 
console.log(" ");//String
console.log(123);//int
console.log(true);//boolean
console.log(null);
console.log(undefined);
console.log([1,2,3,4,5]);//Array inside log
console.log({name:'yuga',Age:4,School:"SRM"});// object insid log

//error Method
console.error('runtime logError');

//warn Method
console.warn('This is a warning.');

//clear Method 
console.clear();

//time and timeEnd Method 
console.time('addition Funection time');
let singleAdd = function(a,b){
    console.log("Addition a vlues "+a+" and b values "+b+"  Total values",a+b);
}
let doubleAdd =function(a,b,c){
    console.log("Addition a vlues "+a+" and b values "+b+"  Total values"+(a+b+c));
}
singleAdd(2,4);//calling function
doubleAdd(4,5,6);

console.timeEnd('addition Funection time');

// table Method 
console.table({a:[12,3,1323],b:'Aravind',c:true,d:[10,20,30],object:{a:1,b:2,c:3}});

//group and count Method 
console.group('For Loop');
    for(let i=0;i<=5;i++){
        console.count();//Empty count 
        console.count('Enter the i values :'+i);
    }

console.groupEnd('For Loop');