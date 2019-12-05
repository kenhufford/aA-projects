Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++){
   callback(this[i]);
  }
}

// var callback = function(input){
//   console.log(input)
// }

// Array.prototype.myMap = function(cb){
//   mapped = []
//   for (let i=0; i<this.length; i++){
//     mapped.push(cb(this[i]));
//   }
//   return mapped;
// }

Array.prototype.myMap = function (cb) {
  mapped = [];
  this.myEach(element => mapped.push(cb(element)));

  return mapped;
}

var cb = function(banana){
  return banana.toUpperCase();
}


Array.prototype.myReduce = function (callback, initValue){
  let arr = this
  if (initValue === undefined) {
    acc = this[0]
    arr = arr.slice(1)
    arr.myEach(element => acc = callback(acc, element));
  } else {
    acc = initValue;
    arr.myEach(element => acc = callback(acc, element));
  }
  return acc;
}

var callback2 = function(acc, el){
  return acc + el
}