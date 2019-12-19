import React from "react";
import * as Minesweeper from "../minesweeper";
import Board from "./board"

class Game extends React.Component{
    constructor(props){
        super(props)
        const board = new Minesweeper.Board(8, 10);
        this.state = {
            board: board
        }
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(e, flagged){
        if (flagged){
            e.toggleFlag()
        } else {
            e.explore();
        }

        this.setState({board: this.state.board})
    }

    restartGame(){
        const board = new Minesweeper.Board(8, 8);
        this.setState({board: board});
    }

    render(){
        let text, modal;

        if (this.state.board.won()) {
            text = "You won!";
            modal = <div className="modal-screen">
                <div className="modal-form">
                <p>{}text</p>
                <button onClick={this.restartGame}>Play Again</button>
                </div>
            </div>;}
        if (this.state.board.lost()){
            text = "you lost!"
            modal = <div className="modal-screen">
        <div className="modal-form">
            <p>{text}</p>
            <button onClick={this.restartGame}>Play Again</button>
        </div>
         </div>;}
        return (
            <div>
                {modal}
                <h1></h1>
                < Board board={this.state.board} updateGame={this.updateGame}/>
            </div>
            
        )
    }

}

export default Game;