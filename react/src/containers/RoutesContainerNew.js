import React, { Component } from 'react';
import { Link } from 'react-router';
import RouteTile from '../components/RouteTile';
import LinkBar from '../components/LinkBar';
import 'whatwg-fetch';

class RoutesContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      routes: []
    };

  }

  componentDidMount() {
    this.getRoutes();
  }

  getRoutes() {
    fetch('https://realtime.mbta.com/developer/api/v2/routes?api_key=RfQnjyQA7EecUcMOjtbp0Q&format=json')
    .then(response => response.json())
    .then(body => {
      body.mode.forEach((mode, modeIndex) => {
        mode.route.forEach((route, routeIndex) => {

        })
      })
    })
    .then(body => body.mode[2].route)
    .then(commuter_rail => {
      this.setState({ routes: commuter_rail });
    });
  }

  render() {

    let routes = this.state.routes.map(route => {
      return(
        <RouteTile
        key = { route.route_id }
        id = { route.route_id }
        name = { route.route_name }
        />
      )
    })
    let links = [
      {location: "Home",
      url: `/`}
    ]
    let currentPage = "Boston Routes"
    return (
      <div>
        <LinkBar
          links = { links }
          currentPage = { currentPage }
        />
        <h1></h1>
        <h3>Boston Train Routes</h3>
        <div className="routes-container">
        {routes}
        </div>
      </div>
    )
  }
}

export default RoutesContainer;
