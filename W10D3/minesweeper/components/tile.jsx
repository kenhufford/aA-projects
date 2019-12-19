import React from 'react';

class Tile extends React.Component{
    constructor(props){
        super(props);
        this.state = {}
        this.handleClick = this.handleClick.bind(this);
    }

    render(){
        let tile = this.props.tileObject;
        let tileClass;
        let tileSymbol;
        console.dir(this.props.updateGame)

        if (tile.explored){
            tileClass = "explored";
            tileSymbol = tile.adjacentBombCount();
        } else if (tile.flagged && !tile.explored){
            tileClass = "flagged";
            tileSymbol = "\u26D4"
        } else {
            tileClass = "tile"
            tileSymbol = " "
        }

        if (tile.explored && tile.bombed){
            tileClass = "bombed";
            tileSymbol =  "\u2623";
            }

        return (
        <div  onClick={this.handleClick} className={tileClass}>{tileSymbol}</div>
            
        )
    }

    handleClick(e){
        const flagged = e.altKey ? true : false;
        this.props.updateGame(this.props.tileObject, flagged)
    }
}


export default Tile;