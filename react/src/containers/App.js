import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import RouteContainer from './RouteContainer';
import RoutesContainer from './RoutesContainer';
import HomePage from '../components/HomePage';

class App extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="react-body">
        <Router history={browserHistory}>
          <Route path='/' component={HomePage} />
          <Route path='/routes' component={RoutesContainer} />
          <Route path='/routes/:id' component={RouteContainer} />
          <Route path='/users/:id' />
        </Router>
      </div>
    )
  }
}

export default App;
