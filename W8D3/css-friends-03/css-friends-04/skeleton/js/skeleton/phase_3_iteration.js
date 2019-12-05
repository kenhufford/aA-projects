// Array.prototype.bubbleSort = function(){
//   let sorted = false; 

//   while (sorted === false){
//     sorted = true;
//     for (let i = 0; i < this.length - 1; i++ ){
//       if (this[i] > this[i+1]){
//         let big = this[i];
//         let small = this[i+1];
//         this[i] = small;
//         this[i+1] = big;
//         sorted = false;
//       }
//     }
//   }
//   return this;
// };

Array.prototype.bubbleSort = function (cb) {
  let sorted = false;
  if (cb === undefined){
    cb = function(ele1, ele2){
      return (ele1 > ele2) ? true : false;
      //   return true;
      // } else {
      //   return false;
      // }
    }
  };

  while (sorted === false) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (cb(this[i], this[i + 1])) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
};

let callback = function(ele1, ele2){
  let alphabet = "abcdefghijklmnopqrstuvwxyz";
  if (alphabet.indexOf(ele1) > alphabet.indexOf(ele2) ){
    return true;
  }
  return false;
}


String.prototype.substrings = function(){
  let result=[];

  for (let i=0; i<this.length; i++){
    for (let j=i; j<this.length; j++){
      result.push(this.slice(i,j+1));
    }
  }
  return result;
}