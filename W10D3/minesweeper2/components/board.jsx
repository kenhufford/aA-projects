import React from "react"
import Game from "./game"
import Tile from "./tile"

class Board extends React.Component{
    constructor(props){
        super(props);
        
    }

    render(){
        return (
            <div>
                {this.props.board.grid.map( (row, i) => {
                    return(
                    <div className="row" key={i}>
                        {row.map( (tile, j) => {
                            return (<Tile tile={tile} updateGame={this.props.updateGame} key={[i,j]}/>)
                        })}
                    </div>)
                })}
            </div> 
        )
    }
}


export default Board;