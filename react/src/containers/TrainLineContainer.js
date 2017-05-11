import React, { Component } from 'react';
import TrainRow from '../components/TrainRow';
import ScheduleHeader from '../components/ScheduleHeader';
import StationScheduleRow from './StationScheduleRow';
import LinkBar from '../components/LinkBar';
import BranchDropDown from '../components/BranchDropDown';
import 'whatwg-fetch';

class TrainLineContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      total_time: 0,
      currentLineId: "",
      currentLineName: "",
      currentDirectionName: "",
      currentDirectionId: 0,
      favoriteLine: false,
      stations: { direction: [{
        direction_id: "0",
        direction_name: "null",
        stop: []
      }]},
      trains: [{
        trains: []
      }],
      branches: [],
      currentUser: null
    };
    this.handleChangeBranch = this.handleChangeBranch.bind(this);
    this.fetchFavorite = this.fetchFavorite.bind(this);
    this.handleFavoriteLineToggle = this.handleFavoriteLineToggle.bind(this)
  }

  getCurrentUser() {
    // fetch(`/api/v1/users/current_user_id`, { credentials: 'same-origin'})
    // .then(response => response.json())
    // .then(body => {
    //   this.setState({ currentUser: body });
    // });
  }

  handleFavoriteLineToggle() {
    this.fetchFavorite("true");
  }

  isCurrentLineFavorite() {
    this.fetchFavorite("false");
  }

  fetchFavorite(toggleFav) {
    fetch(`/api/v1/users/toggle_favorite_train_line?line=${this.state.currentLineId}&toggle=${toggleFav}`, { credentials: 'same-origin' })
    .then(response => response.json())
    .then(body => {

      this.setState({ favoriteLine: body });
    });
  }

  handleChangeBranch(event) {
    let directionId = this.state.stations.direction.filter((d) => {
      return d.direction_name == event.target.value;
    });
    this.setState({
      currentDirectionName: event.target.value,
      currentDirectionId: directionId[0].direction_id
    });
  }

  componentDidMount() {
    let id = location.href.match(/([^\/]*)\/*$/)[1];
    this.setState({ currentLineId: id }, this.getData);
    // this.calcTime();
  }

  calcTime() {
    let time = this.state.total_time + 10;
    this.setState({
      total_time: time
    }, () => {
      window.setTimeout(this.calcTime, 1000);
    });
    debugger
  }

  getData() {
    this.getCurrentLine();
    this.getStations();
    this.getCurrentUser();
    this.isCurrentLineFavorite();
  }

  componentDidUpdate(prevProps, prevState) {

  }
  componentWillUpdate(nextProps, nextState) {

  }

  getStations() {
    fetch(`https://realtime.mbta.com/developer/api/v2/stopsbyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${this.state.currentLineId}`)
    .then(response => response.json())
    .then(body => {
      this.setState({
        currentDirectionId: body.direction[0].direction_id,
        currentDirectionName: body.direction[0].direction_name,
        stations: body
      });
    });
  }

  getCurrentLine() {
    let midnight = (new Date()).setHours(0,0,0,0) / 1000;
    fetch(`https://realtime.mbta.com/developer/api/v2/schedulebyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${this.state.currentLineId}&max_trips=100&max_time=1440&datetime=${midnight}`)
    .then(response => response.json())
    .then(body => {
      this.setState({ currentLineName: body.route_name });
      let branches = [];
      body.direction.forEach((d) => {
        branches.push(d.direction_name);
      });
      this.setState({
        branches: branches
      });
      return body.direction;
    })
    .then(body => {
      let trainsState = [];
      body.forEach((branch) => {
        let branchState = []
        branch.trip.forEach((trip) => {
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
          branchState.push(trainState);
        });
        branchState = {
          direction_id: branch.direction_id,
          trains: branchState
        }
        trainsState.push(branchState)
      });
      this.setState({
        trains: trainsState
      });
    });
  }

  // componentDidMount() {
  //   // console.log("trainline did mount")
  // }

  render() {
    // console.log(" ")
    // console.log("render")
    let trainNumsTile = this.state.trains[this.state.currentDirectionId].trains.map(train => {
      return(
        <ScheduleHeader
          key = { train.fullName }
          num = { train.trainNum }
          line = { this.state.currentLineId }
        />
      )
    })
    let stops = this.state.stations.direction[this.state.currentDirectionId].stop
    let allStations = stops.map((station, index) => {
      return (
        <StationScheduleRow
          key = { station.stop_order }
          stop_order = { station.stop_order }
          id = { station.stop_id }
          name = { station.stop_name }
          trains = { this.state.trains[this.state.currentDirectionId].trains }
          currentDirection = { this.state.currentDirectionName }
          line = { this.state.currentLineId }
        />
      )
    }, this)
    let links = [
      {location: "Home",
      url: `/`},
      {location: "Boston Lines",
      url: '/train_lines'}
    ]

    let favIcon;
    if (this.state.favoriteLine ) {
      favIcon = <img className="fav-star" src={assetHelper["gold-star-icon"]} height="25px" width="25px"></img>
    } else {
      favIcon = <img className="fav-star" src={assetHelper["black-star-icon"]} height="25px" width="25px"></img>
    }

    let favorite;
    if (this.state.currentUser) {
      favorite = <button className="button" onClick={ this.handleFavoriteLineToggle }>Favorite!</button>
    } else {
      favorite = "Log in to keep track of your frequently used stops and trains!"
    }
    return (
      <div>
        <LinkBar
        links = { links }
        currentPage = { this.state.currentLineId }
        />
        <h3>{ this.state.currentLineName } { favIcon }</h3>
        <BranchDropDown
        branches = { this.state.branches }
        currentDirection = { this.state.currentDirectionName }
        onChange = { this.handleChangeBranch }
        id = {"whatever"}
        />
        <span> &nbsp;&nbsp;&nbsp;&nbsp; Use this line a lot? &nbsp;{favorite}</span>
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
