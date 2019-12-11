const Util = require("./util.js");
const MovingObject = require("./moving_object.js");
const Bullet = require("./bullet.js");

function Ship(position, game){
  const COLOR = "#ff05ea";
  const RADIUS = 10;
  let options = {
    pos: position,
    vel: [0,0],
    radius: RADIUS,
    color: COLOR,
    gameInstance: game
  };  
  MovingObject.call(this, options);
}
Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function(){
  this.pos = this.game.randomPosition();
  this.vel = [0,0];
}

Ship.prototype.power = function(impulse){
  let x = this.vel[0];
  let y = this.vel[1];
  this.vel = [impulse[0] + x, impulse[1] + y];
}

Ship.prototype.fireBullet = function(){
  let bullet = new Bullet(this.vel, this.pos, this.game);
  this.game.bullets.push(bullet);
}


module.exports = Ship;