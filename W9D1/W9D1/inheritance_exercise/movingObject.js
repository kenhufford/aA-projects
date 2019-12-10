function MovingObject(name, size, speed){
  this.name = name;
  this.size = size;
  this.speed = speed;
}

MovingObject.prototype.flies = function(){
  console.log(`${this.name} is ${this.size} big and flies at ${this.speed} speed`);
};

Function.prototype.inherits = function(ParentClass){
  Surrogate.prototype = ParentClass.prototype;
  this.prototype = new Surrogate(); 
  this.prototype.constructor = this;
};


Ship.inherits(MovingObject);
Asteroid.inherits(MovingObject);

function Ship(name, size, speed) {
  MovingObject.call(this, name, size, speed);
}

Ship.prototype.shoot = function () {
  console.log(`${this.name} shoots!`);
};


function Asteroid(name, size, speed) {
  MovingObject.call(this, name, size, speed);
}

Asteroid.prototype.hurls = function(){
  console.log(`${this.name} hurls!!!`);
};


function Surrogate() {
}


ship1 = new Ship("Enterprise", 50, 150);
asteroid1 = new Asteroid("Bruce Willis", 9001, 9000);
asteroid1.hurls();
ship1.shoot();
ship1.flies();
asteroid1.flies();