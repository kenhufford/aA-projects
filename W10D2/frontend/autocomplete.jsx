import React from 'react';

class Autocomplete extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      inputVal: ""
    };

    this.setInputVal = this.setInputVal.bind(this);
  }

  setInputVal(event){
    this.setState({ inputVal: event.target.value });
  }

  render(){
    return (
      <div>
        <input onChange={this.setInputVal} type="text"/>
        <ul>
          {
          this.props.namesProps.filter(el => el.name.toLowerCase().includes(this.state.inputVal.toLowerCase())).map( (obj, index) => 
            <marquee key={index}>{obj.name}</marquee>
          ) 
          }
        </ul>
      </div>
      )
  };
};


export default Autocomplete;

// e2cdeb9ac1b38f088a30d4058a1fc4f9