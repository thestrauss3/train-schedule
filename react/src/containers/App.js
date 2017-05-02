import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import TrainLineContainer from './TrainLineContainer';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <Router history={browserHistory}>
          <Route path='train_lines/:id' component={TrainLineContainer} />
        </Router>
      </div>
    )
  }
}

export default App;
