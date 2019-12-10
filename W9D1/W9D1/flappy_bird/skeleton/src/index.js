import FlappyBird from './game';

const canvas = document.getElementById('bird-game');
let newGame = new FlappyBird(canvas);
newGame.restart();