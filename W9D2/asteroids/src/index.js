console.log("Webpack is working!");
const MovingObject = require ("./moving_object.js");
const Asteroid = require ("./asteroid.js");
const Game = require ("./game.js");
const GameView = require ("./game_view.js");


window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;



window.addEventListener('DOMContentLoaded', () => {
  let c = document.getElementById("game-canvas");
  let ctx = c.getContext("2d");
  const img = new Image();
  img.onload = function () {
    ctx.drawImage(img, 0, 0);
  };
  img.src = "myImage.jpg";
  let gameView = new GameView(ctx, img);
  gameView.start();
});


