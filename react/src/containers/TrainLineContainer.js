import React, { Component } from 'react';
import TrainRow from '../components/TrainRow';
import ScheduleHeader from '../components/ScheduleHeader';
import StationScheduleRow from '../containers/StationScheduleRow'

class TrainLineContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentLineId: "null",
      currentLineName: "null",
      currentDirection: "inbound",
      trains: [],
      stations: []
    };

  }

  componentDidMount() {
    let id = location.href.match(/([^\/]*)\/*$/)[1];
    this.setState({ currentLineId: id });
    this.getCurrentLine(id);
    this.getTrains(id);
    this.getStations(id);
  }

  getCurrentLine(id) {
    this.setState({ currentLineId: id });
    fetch(`/api/v1/train_lines/${id}`)
    .then(response => response.json())
    .then(body => {
      this.setState({ currentLineName: body.name });
    });
    return id;
  }

  getTrains(id) {
    fetch(`/api/v1/train_lines/${id}/trains`)
    .then(response => response.json())
    .then(body => {
      this.setState({ trains: body });
    });
  }

  getStations(id) {
    fetch(`/api/v1/train_lines/${id}/stations`)
    .then(response => response.json())
    .then(body => {
      this.setState({ stations: body });
    });
  }

  render() {
    let trainNums = this.state.trains.map(train => {
      return(
        <ScheduleHeader
          key = { train.id }
          num = { train.train_num }
        />
      )
    })
    let allStations = this.state.stations.map(station => {
      return (
        <StationScheduleRow
          key = { station.id }
          name = { station.name }
          wifi = { station.has_wifi }
          trains = { this.state.trains }
          currentDirection = { this.state.currentDirection }
        />
      )
    })
    return (
      <div>
        <h3>Full schedule for the {this.state.currentLineName}</h3>
        <table id="line-schedule">
          <thead><tr><th>Train Number</th>{ trainNums }</tr></thead>
          <tbody>
          {allStations}
          </tbody>
        </table>
      </div>
    )
  }
}

export default TrainLineContainer;
// window.location.href.substr(window.location.href.lastIndexOf('/') + 1)
// location.href.substr(location.href.lastIndexOf('/') + 1)
//
// location.href.match(/([^\/]*)\/*$/)[1];
