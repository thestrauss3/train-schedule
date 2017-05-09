import React, { Component } from 'react';
import { Link } from 'react-router';
import TrainLineTile from '../components/TrainLineTile';
import LinkBar from '../components/LinkBar';

class TrainLinesContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      lines: []
    };

  }

  componentDidMount() {
    this.getLines();
  }

  getLines() {
    fetch('https://realtime.mbta.com/developer/api/v2/routes?api_key=RfQnjyQA7EecUcMOjtbp0Q&format=json')
    .then(response => response.json())
    .then(body => body.mode[2].route)
    .then(commuter_rail => {
      this.setState({ lines: commuter_rail })
    })
  }

  render() {

    let lines = this.state.lines.map(line => {
      return(
        <TrainLineTile
        key = { line.route_id }
        id = { line.route_id }
        name = { line.route_name }
        />
      )
    })
    let links = [
      {location: "Home",
      url: `/`}
    ]
    let currentPage = "Boston Lines"
    return (
      <div>
        <LinkBar
          links = { links }
          currentPage = { currentPage }
        />
        <h1></h1>
        <h3>The train lines in Boston are as following</h3>
        <ul>
        {lines}
        </ul>
      </div>
    )
  }
}

export default TrainLinesContainer;
