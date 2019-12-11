const Game = require ("./game.js");

function GameView(ctx, img){
  this.game = new Game();
  this.ctx = ctx;
  this.bindKeyHandlers();
  this.img = img;
}

GameView.prototype.start = function(){
  let that = this;
  
  setInterval(function() { 
    that.game.step(); 
    that.game.draw(that.ctx, that.img);
  }, 
  20);
};

GameView.prototype.bindKeyHandlers = function(){
  let that = this;
  key('8', function () {
    that.game.ship.power([0,-1]);
  });
  key('2', function () {
    that.game.ship.power([0, 1]);
  });
  key('4', function () {
    that.game.ship.power([-1,0]);
  });
  key('6', function () {
    that.game.ship.power([1,0]);
  });
  key('9', function () {
    that.game.ship.power([1,-1]);
  });
  key('7', function () {
    that.game.ship.power([-1, -1]);
  });
  key('3', function () {
    that.game.ship.power([1,1]);
  });
  key('1', function () {
    that.game.ship.power([-1,1]);
  });
  key('space', function () {
    that.game.ship.fireBullet();
  });
// key.bind('down', Ship.power([-1, 0]));
// key.bind('left', Ship.power([0, -1]));
// key.bind('right', Ship.power([0, 1]));
};

module.exports = GameView;