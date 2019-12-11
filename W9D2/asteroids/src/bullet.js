const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Bullet(direction, position, game){
  let velocity = [direction[0] * 5, direction[1] * 5];
  const COLOR = "#0dff00";
  const RADIUS = 5;
  let options = {
    pos: position,
    vel: velocity,
    radius: RADIUS,
    color: COLOR,
    gameInstance: game
  };
  MovingObject.call(this, options);
}

Util.inherits(Bullet, MovingObject);


Bullet.prototype.isWrappable = false;

module.exports = Bullet;