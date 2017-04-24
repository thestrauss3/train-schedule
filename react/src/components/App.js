import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentLine: "null",
      currentDirection: "null"
    }

  }

  render() {
    return (
      <div>
        <h2>Hello from app</h2>
      </div>
    )
  }
}

export default App;
