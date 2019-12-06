Array.prototype.myEach = function(callback){
    for (let i = 0; i < this.length; i++){
        callback(this[i]);
    }
}

Array.prototype.myMap = function(callback){
    mapped = [];
    this.myEach(element => mapped.push(callback(element)))
    return mapped;
}

let callback = function(element){
    return element * 2;
}