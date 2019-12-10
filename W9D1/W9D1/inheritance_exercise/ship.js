function Ship(name, size, speed){
  //inherit
  MovingObject.call(this, name, size, speed);
}

Ship.prototype.shoot = function(){
  console.log(`${this.name} shoots!`);
};

module.exports = Ship;