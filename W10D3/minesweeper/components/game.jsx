import React from 'react';
import * as Minesweeper from '../minesweeper';
import Board from './board'

class Game extends React.Component{
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(8, 10);
    this.state = {
      board: board
    }
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, flagged){
    if (flagged){
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    if (this.state.board.won()){
      alert("You win!")
    } 
    if (this.state.board.lost()){
      alert("You lost!!")
    } 
    this.setState({board: this.state.board})
  }

  restartGame(){
    let board = new Minesweeper.Board(8, 10);
    this.setState({ board: board });
  }

  render(){
    let modal;
    if (this.state.board.lost() || this.state.board.won()){
      const text = this.state.board.lost() ? "YOU LOSE" : "YOU WON"
      modal =
      <div className='modal-screen'>
        <div className='modal-content'>
          <p>{text}</p>
          <button onClick={this.restartGame}>Play Again</button>
        </div>
      </div>;
    }
    return (
      <div>
        {modal}
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    );
  }

}
export default Game;
