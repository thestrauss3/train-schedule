import React, { Component } from 'react';
import TrainRow from '../components/TrainRow';
import ScheduleHeader from '../components/ScheduleHeader';
import StationScheduleRow from './StationScheduleRow';
import LinkBar from '../components/LinkBar';
import BranchDropDown from '../components/BranchDropDown';

class TrainLineContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentLineId: "",
      currentLineName: "",
      currentDirection: "",
      stations: [],
      trains: [],
      branches: []
    };
    this.handleChangeBranch = this.handleChangeBranch.bind(this);
  }

  handleChangeBranch(event) {
    this.setState({ currentDirection: event.target.value });
  }

  componentDidMount() {
    let id = location.href.match(/([^\/]*)\/*$/)[1];
    let midnight = (new Date()).setHours(0,0,0,0) / 1000;
    this.setState({ currentLineId: id });
    this.getCurrentLine(id, midnight);
    this.getStations(id);
  }

  getStations(id) {
    fetch(`http://realtime.mbta.com/developer/api/v2/stopsbyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${id}`)
    .then(response => response.json())
    .then(body => {
      let branch = body.direction.filter((d) => {
        return d.direction_name == this.state.currentDirection;
      });
      if (branch.length === 0) {
        branch = body.direction[0];
      }
      return branch;
    })
    .then(body => {
      this.setState({
        stations: body.stop
      });
    });
  }

  getCurrentLine(id, midnight) {
    fetch(`http://realtime.mbta.com/developer/api/v2/schedulebyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${id}&max_trips=100&max_time=1440&datetime=${midnight}`)
    .then(response => response.json())
    .then(body => {
      this.setState({ currentLineName: body.route_name });
      let direction = this.state.currentDirection == "Inbound" ? 1 : 0;
      let branches = [];
      body.direction.forEach((d) => {
        branches.push(d.direction_name);
      });
      this.setState({
        branches: branches
      });
      return body.direction[direction];
    })
    .then(body => {
      let trainsState = [];
      body.trip.forEach((trip) => {
        let fullName = trip.trip_name;
        let trainNum = trip.trip_name.split(' ')[0];
        let stops = [];
        trip.stop.forEach((stop) => {
          stops.push(stop);
        });
        let trainState = {
          fullName: fullName,
          trainNum: trainNum,
          stops: stops
        };
        trainsState.push(trainState);
      });
      this.setState({
        trains: trainsState
      });
    });
  }

  render() {
    let trainNumsTile = this.state.trains.map(train => {
      return(
        <ScheduleHeader
          key = { train.id }
          num = { train.trainNum }
        />
      )
    })
    let allStations = this.state.stations.map(station => {
      return (
        <StationScheduleRow
          key = { station.stop_id }
          stop_sequence = { station.stop_sequence }
          id = { station.stop_id }
          name = { station.stop_name }
          trains = { this.state.trains }
          currentDirection = { this.state.currentDirection }
        />
      )
    }, this)
    let links = [
      {location: "Home",
      url: `/`},
      {location: "Train Lines",
      url: '/train_lines'}
    ]
    return (
      <div>
        <LinkBar
          links = { links }
          currentPage = { links }
        />
        <h3>Full schedule for the {this.state.currentLineName}</h3>
        <BranchDropDown
          branches = { this.state.branches }
          currentDirection = { this.state.currentDirection }
          onChange = { this.handleChangeBranch }
        />
        <table id="line-schedule">
          <thead><tr><th className="schedule-header-corner">Train Number</th>{ trainNumsTile }</tr></thead>
          <tbody>
          {allStations}
          </tbody>
        </table>
      </div>
    )
  }
}

export default TrainLineContainer;
