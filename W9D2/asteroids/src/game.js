const Ship = require("./ship.js");
const Asteroid = require("./asteroid.js");

function Game(){
  this.DIM_X = 800;
  this.DIM_Y = 600;
  this.NUM_ASTEROIDS = 30;
  this.asteroids = [];
  this.bullets = [];
  this.score = 0;
  this.addAsteroids();
  this.ship = new Ship(this.randomPosition(), this);
}

Game.prototype.addAsteroids = function(){
  while (this.asteroids.length < this.NUM_ASTEROIDS) {
    let that = this;
    this.asteroids.push(new Asteroid(this.randomPosition(), this));
  }
};

Game.prototype.randomPosition = function(){
  let x = Math.floor(Math.random() * this.DIM_X);
  let y = Math.floor(Math.random() * this.DIM_Y);
  return [x,y];
};

Game.prototype.draw = function(ctx,img){
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  img.onload();
  let objectArray = this.allObjects();
  objectArray.forEach( (object) => object.draw(ctx));
};

Game.prototype.moveObjects = function(){
  let objectArray = this.allObjects();
  objectArray.forEach((object) => object.move());
};

Game.prototype.wrap = function(pos){
  let x = pos[0];
  let y = pos[1];
  if (x > this.DIM_X) x = 0;
  if (x < 0) x = this.DIM_X;
  if (y > this.DIM_Y) y = 0;
  if (y < 0) y = this.DIM_Y;
  return [x,y];
};

Game.prototype.checkCollisions = function(){
  let objects = this.allObjects();
  
  for (let i = 0; i < objects.length; i++){
    for (let j = i+1; j < objects.length; j++) {
      if (objects[i].isCollidedWith(objects[j])){
        objects[i].collideWith(objects[j]);
      }
    }
  }
};

Game.prototype.step = function(){
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function(){
  for (let i = 0; i < arguments.length; i++){
    if (arguments[i] instanceof Asteroid){
      let index = this.asteroids.indexOf(arguments[i]);
      this.asteroids.splice(index, 1);
    } else {
      let index = this.bullets.indexOf(arguments[i]);
      this.bullets.splice(index, 1);
    }
  }
};

Game.prototype.allObjects = function(){
  let objects = this.asteroids.concat([this.ship], this.bullets);
  return objects;
}

Game.prototype.isOutOfBounds = function(pos){
  let x = pos[0];
  let y = pos[1];
  if (x > this.DIM_X) return true;
  if (x < 0) return true;
  if (y > this.DIM_Y) return true;
  if (y < 0) return true;
  return false;
}

module.exports = Game;