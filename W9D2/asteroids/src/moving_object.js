function MovingObject(options){
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.gameInstance;
}

MovingObject.prototype.isWrappable = true;

MovingObject.prototype.draw = function (ctx){
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.stroke();
  ctx.fillStyle = this.color;
  ctx.fill();
};

MovingObject.prototype.move = function() {
  let x = this.vel[0];
  let y = this.vel[1];
  let xy = [this.pos[0] + x, this.pos[1] + y];
  if (this.game.isOutOfBounds(xy)) {
    if (this.isWrappable){
      this.pos = this.game.wrap(xy);
      return this.pos;
    } else {
      this.game.remove(this);
    }
  }
  this.pos = xy;
};

MovingObject.prototype.isCollidedWith = function(otherObject){
  let x1 = this.pos[0];
  let x2 = otherObject.pos[0];
  let y1 = this.pos[1];
  let y2 = otherObject.pos[1];
  
  let distance = Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));
  return (distance < this.radius + otherObject.radius) ? true : false;
};

MovingObject.prototype.collideWith = function (otherObject) {
  // this.game.remove(this, otherObject);
};



module.exports = MovingObject;