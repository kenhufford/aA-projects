import React from 'react';
import ReactDOM from 'react-dom';
import Game from './components/game';
import Tile from './components/tile';
import Board from './components/board';
 
document.addEventListener("DOMContentLoaded", () => {
 ReactDOM.render(
   <Game />,
   document.getElementById('root')
 );
});
