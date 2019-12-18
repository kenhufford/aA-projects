import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentTab: 0
    };
    this.changeTab = this.changeTab.bind(this);
  }

  changeTab(event) {
    event.preventDefault();
    this.setState({ currentTab: event.target.attributes.data.value});
  }

  render() {
    return (
      <div >
        <ul className="tab-section">
          {
            this.props.tabsProps.map((prop, index) =>
              <h1 onClick={this.changeTab} key={index} data={index}>{prop.title}</h1>
            )
          }
        </ul>
          <section id="tab-content">{this.props.tabsProps[this.state.currentTab].content}</section>
      </div>
    )
  }
}

export default Tabs;