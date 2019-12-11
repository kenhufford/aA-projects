const Util = require ("./util.js");
const Ship = require ("./ship.js");
const Bullet = require ("./bullet.js");
const MovingObject = require ("./moving_object.js");


function Asteroid(position, game){
  const COLOR = "#00d9ff";
  const RADIUS = 30;
  let options = {
    pos : position,
    vel : Util.randomVec(5),
    radius : RADIUS,
    color : COLOR,
    gameInstance: game
  };
  MovingObject.call(this, options);
}
Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function (otherObject) {
  if (otherObject instanceof Ship) {
    // debugger;
    otherObject.relocate();
  } else if (otherObject instanceof Bullet) {
    this.game.score += 1;
    console.log(this.game.score);
    this.game.remove(this, otherObject);
  } else {
    this.game.remove(this, otherObject);
  }
};



module.exports = Asteroid;
let bob = Asteroid.prototype.collideWith;
module.exports.collideWith = bob;