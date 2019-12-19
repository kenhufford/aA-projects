import React from 'react';
import Game from './game';
import Tile from './tile';

class Board extends React.Component{
    constructor(props){
        super(props);
        this.state = {}
    }

    render(){
        return (
            <div id="board">
                {this.props.board.grid.map( (row, i) => {
                    return (<div className="row" key={i}>
                        {row.map ( (ele, j ) => {
                            return (< Tile tileObject={ele} updateGame={this.props.updateGame} key={[i,j]} />)
                        })
                        }
                    </div>)
                })
                }
            </div>
        )
    }
}

export default Board;
