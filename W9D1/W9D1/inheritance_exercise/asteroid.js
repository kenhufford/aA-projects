function Asteroid(name, size, speed){
  //inherit
  MovingObject.call(this, name, size, speed);
}

Asteroid.prototype.hurls = function(){
  console.log(`${this.name} hurls!!!`);
};

module.exports = Asteroid;