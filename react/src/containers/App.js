import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import TrainLineContainer from './TrainLineContainer';
import TrainLinesContainer from './TrainLinesContainer';
import HomePage from '../components/HomePage';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <Router history={browserHistory}>
          <Route path='/' component={HomePage} />
          <Route path='/train_lines' component={TrainLinesContainer} />
          <Route path='/train_lines/:id' component={TrainLineContainer} />
          <Route path='/users/:id' />
        </Router>
      </div>
    )
  }
}

export default App;
