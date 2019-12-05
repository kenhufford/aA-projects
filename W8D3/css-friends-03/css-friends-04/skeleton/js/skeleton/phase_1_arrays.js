Array.prototype.uniq = function () {
  let arrUni = [];
  for (let i = 0; i < this.length; i++) {
    if (!arrUni.includes(this[i])) {
      arrUni.push(this[i]);
    }
  };
  return arrUni
};


Array.prototype.twoSum = function (){
  let result = [];
  for(let i = 0; i<this.length; i++){
    for (let j = (i+1); j < this.length; j++){
      if (this[i] + this[j] === 0 && i !== j){
        result.push([i,j]);
      }
    }
  }
  return result
}


Array.prototype.transpose = function(){
  let result = []
  for(let i = 0; i<this.length; i++){
    let sub = []
    for(let j = 0; j<this.length; j++){
      sub.push(this[j][i]);
    }
    result.push(sub);
  }
  return result
}

