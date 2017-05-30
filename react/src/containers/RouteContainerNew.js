import React, { Component } from 'react';
import TrainRow from '../components/TrainRow';
import ScheduleHeader from '../components/ScheduleHeader';
import StationScheduleRow from './StationScheduleRow';
import LinkBar from '../components/LinkBar';
import BranchDropDown from '../components/BranchDropDown';
import 'whatwg-fetch';

class RouteContainer extends Component {
  constructor(props) {
    super(props);

    this.state = {
      data: {

      }
    };
    this.handleChangeBranch = this.handleChangeBranch.bind(this);
    this.fetchFavorite = this.fetchFavorite.bind(this);
    this.handleFavoriteRouteToggle = this.handleFavoriteRouteToggle.bind(this);
  }

  getCurrentUser() {
    fetch(`/api/v1/users/current_user_id`, { credentials: 'same-origin'})
    .then(response => response.json())
    .then(body => {
      this.setState({ currentUser: body });
    });
  }

  handleFavoriteRouteToggle() {
    this.fetchFavorite("true");
  }

  isCurrentRouteFavorite() {
    this.fetchFavorite("false");
  }

  fetchFavorite(toggleFav) {
    fetch(`/api/v1/users/toggle_favorite_route?route=${this.state.currentRouteId}&toggle=${toggleFav}`, { credentials: 'same-origin' })
    .then(response => response.json())
    .then(body => {
      this.setState({ favoriteRoute: body });
    });
  }

  handleChangeBranch(event) {
    let directionId = this.state.stations.direction.filter((d) => {
      return d.direction_name === event.target.value;
    });
    this.setState({
      currentDirectionName: event.target.value,
      currentDirectionId: directionId[0].direction_id
    });
  }

  componentDidMount() {
    // let id = location.href.match(/([^\/]*)\/*$/)[1];
    // this.setState({ currentRouteId: id }, this.getData);
    this.fetchData();
  }

  fetchData() {
    fetch(`https://realtime.mbta.com/developer/api/v2/stopsbyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${this.state.currentRouteId}`)
    .then(response => response.json())
    .then(body => {
      this.setState({
        currentDirectionId: body.direction[0].direction_id,
        currentDirectionName: body.direction[0].direction_name,
        stations: body
      });
    });
  }

  getData() {
    this.getCurrentRoute();
    this.getStations();
    this.getCurrentUser();
    this.isCurrentRouteFavorite();
  }

  getStations() {
    fetch(`https://realtime.mbta.com/developer/api/v2/stopsbyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${this.state.currentRouteId}`)
    .then(response => response.json())
    .then(body => {
      this.setState({
        currentDirectionId: body.direction[0].direction_id,
        currentDirectionName: body.direction[0].direction_name,
        stations: body
      });
    });
  }

  getCurrentRoute() {
    let midnight = (new Date()).setHours(0,0,0,0) / 1000;
    fetch(`https://realtime.mbta.com/developer/api/v2/schedulebyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=${this.state.currentRouteId}&max_trips=100&max_time=1440&datetime=${midnight}`)
    .then(response => response.json())
    .then(body => {
      this.setState({ currentRouteName: body.route_name });
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
        let branchState = [];
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
        };
        trainsState.push(branchState);
      });
      this.setState({
        trains: trainsState
      });
    });
  }

  render() {
    let trainNumsTile = this.state.trains[this.state.currentDirectionId].trains.map(train => {
      return(
        <ScheduleHeader
          key = { train.fullName }
          num = { train.trainNum }
          route = { this.state.currentRouteId }
          currentUser = { this.state.currentUser }
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
          route = { this.state.currentRouteId }
          currentUser = { this.state.currentUser }
        />
      )
    }, this)
    let links = [
      {location: "Home",
      url: `/`},
      {location: "Boston Routes",
      url: '/routes'}
    ]

    let icon;
    if (this.state.favoriteRoute && this.state.currentUser) {
      icon = assetHelper["gold-star-icon"]
    } else if (this.state.currentUser) {
      icon = assetHelper["black-star-icon"]
    }
    let favIcon = <img className="fav-route-star fav-star" src={icon}onClick={ this.handleFavoriteRouteToggle }></img>

    let favoritePromptLog;
    if (!this.state.currentUser) {
      favoritePromptLog = <span>  Log in to keep track of frequently used trains!</span>
    }
    return (
      <div className="route-container">
        <div className="route-header">
          <LinkBar
          links = { links }
          currentPage = { this.state.currentRouteId }
          />
          <h3>{ this.state.currentRouteName } { favIcon }</h3>
          <BranchDropDown
          branches = { this.state.branches }
          currentDirection = { this.state.currentDirectionName }
          onChange = { this.handleChangeBranch }
          id = {"whatever"}
          />
          {favoritePromptLog}
        </div>
        <div className="table-div">
          <table id="route-schedule">
            <thead><tr><th className="schedule-header-corner schedule-header-row">Train Number</th>{ trainNumsTile }</tr></thead>
            <tbody>
            {allStations}
            </tbody>
          </table>
        </div>
      </div>
    )
  }
}

export default RouteContainer;
