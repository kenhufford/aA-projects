import React from "react";

class Tile extends React.Component{
    constructor(props){
        super(props);
        this.clickHandle = this.clickHandle.bind(this)
    }

    clickHandle(e){
        let flagged = e.altKey
        this.props.updateGame(this.props.tile, flagged)
    }

    render(){
        let tile = this.props.tile
        let tileSymbol;
        let tileClass;
        if (tile.bombed && tile.explored){
            tileSymbol = "B"
            tileClass = "tile bombed";
        }
        else if (tile.flagged){
            tileSymbol = "F"
            tileClass = "tile flagged";
        }
        else if (tile.explored){
            tileSymbol = tile.adjacentBombCount();
            tileClass = "tile explored";
        } else {
            tileSymbol = "T"
            tileClass = "tile"
        }

        console.log(tileClass)
        return(
             <div onClick={this.clickHandle} className={tileClass}>{tileSymbol}</div>
            )
    }
}

export default Tile;