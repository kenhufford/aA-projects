import React from 'react';

class Clock extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      time : new Date()
    };
    this.tick = this.tick.bind(this);
    this.interval = () => setInterval(this.tick, 1000);
  }

  tick(){
    this.setState({
      time: new Date()
    }) 
  }

  componentDidMount(){
    this.interval();
  }
  
  componentWillUnmount(){
    clearInterval(this.interval)
  }

  render(){
    return (
      <div className="clock">
        <section className="clock-section">
          <h2>Time</h2>
          <h3>{this.state.time.toLocaleTimeString()}</h3>
        </section>
        <section className="clock-section">
          <h2>Date</h2>
          <h3>{this.state.time.toDateString()}</h3>
        </section>
      </div>
    )
  }

  
  
}

export default Clock;