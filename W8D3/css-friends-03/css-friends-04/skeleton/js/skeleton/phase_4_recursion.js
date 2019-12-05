let range = function(start, end){
  if (start === end) {
    return [end];
  }

  let prevStep = range(start+1, end);
  prevStep.unshift(start);
  return prevStep;
};

let sumRec = function(arr) {
  if (arr.length === 0) {
    return 0;
  }
  let sum = sumRec(arr.slice(1)) + arr[0];
  return sum;
};

let exponent = function(base, exp){
  if (exp === 0) {
    return 1;
  }
  let ans = exponent(base, exp-1) * base;
  return ans;
};


