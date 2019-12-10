
// function sum(){
//   let sum = 0;
//   for(i = 0; i < arguments.length; i++){
//     sum += arguments[i];
//   }
//   return sum;
// }

function sum(...args){
  let sum = 0;
  for(let i = 0; i < args.length; i++){
    sum += args[i];
  }
  return sum;
}

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));

Function.prototype.myBind = function(context, ...bindTimeArgs){
  let that = this;
  return function(...callTimeArgs){
    that.call(context, ...bindTimeArgs, ...callTimeArgs);
  };
};
// Function.prototype.myBind = function(context){
//   let that = this;
//   let args = [];
//   for(let i = 1; i < arguments.length; i++){
//     args.push(arguments[i]);
//   }
//   return function(){
//     that.call(context, ...args);
//   };
// };


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");


function curriedSum(numArgs){
  let numbers = [];
  debugger;
  function _curriedSum(num){
    let sum = 0;
    numbers.push(num);
    if (numbers.length === numArgs) {
      for(let i = 0; i<numbers.length; i++){
        sum+=numbers[i];
      }
      return sum;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// console.log(curriedSum(4)(5)(30)(20)(1));

Function.prototype.curry = function(numArgs){
  let args = [];
  let that = this;
  function _curry(arg){
    args.push(arg);
    if (numArgs != args.length) {
      return _curry;
    } else {
      that.apply(null, args);
    }
  }
  return _curry;
};

function sum(...args){
  let sum = 0;
  for (let i= 0; i<args.length; i++){
    sum += args[i];
  }
  console.log(sum);
}
