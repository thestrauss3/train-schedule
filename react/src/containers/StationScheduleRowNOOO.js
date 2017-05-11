import React, { Component } from 'react';
import TrainStopStamp from '../components/TrainStopStamp';
import 'whatwg-fetch';

class StationScheduleRow extends Component {
  constructor(props) {
    super(props)

    this.state = {
      stops: [],
      favorite: false
    }

    this.getStops = this.getStops.bind(this)
    this.fetchFavorite = this.fetchFavorite.bind(this)
    this.handleFavoriteStationToggle = this.handleFavoriteStationToggle.bind(this);
    this.isCurrentStationFavorite = this.isCurrentStationFavorite.bind(this)
  }

  componentWillReceiveProps(nextProps) {
    // console.log("station schedule row will receive props");
    console.log(nextProps.trains);
    console.log("will receive props");
    this.getStops(nextProps)
    // let stop_times = nextProps.trains.map(train =>{
    //   let train_stop = train.stops.filter((stop) => {
    //     return stop.stop_id == nextProps.id
    //   }, this)
    //   if (train_stop[0]) {
    //     let stopDateTime = new Date(train_stop[0].sch_arr_dt * 1000);
    //     let hours = stopDateTime.getHours();
    //     let minutes = stopDateTime.getMinutes();
    //     minutes = minutes < 10 ? '0'+ minutes : minutes;
    //     let stopTime = hours + ":" + minutes;
    //     return({
    //       key: train.id,
    //       stopTime: stopTime,
    //       trainNum: train.trainNum,
    //       stopDateTime: stopDateTime,
    //       stationId: nextProps.id
    //     })
    //   } else {
    //     return (
    //       null
    //     )
    //   }
    // });
    // this.setState({ stops: stop_times }, console.log(this.state))
  }

  shouldComponentUpdate(nextProps, nextState) {
    console.log("should update");
    // if (this.props.trains == nextProps.trains) {
    //   // console.log("station schedule row NOT updating.... NO UPDATE");
    //   return false
    // } else {
    //   return true
    // }
  return true
  }

  componentDidUpdate() {
    console.log(this.props.trains);
    console.log("did update");
    // this.getStops(this.props.trains)
    // console.log("station schedule row did update");
  }

  getStops(nextProps) {
    console.log("step 2.5");
    let stop_times = nextProps.trains.map(train =>{
      let train_stop = train.stops.filter((stop) => {
        return stop.stop_id == nextProps.id
      }, this)
      if (train_stop[0]) {
        let stopDateTime = new Date(train_stop[0].sch_arr_dt * 1000);
        let hours = stopDateTime.getHours();
        let minutes = stopDateTime.getMinutes();
        minutes = minutes < 10 ? '0'+ minutes : minutes;
        let stopTime = hours + ":" + minutes;
        return({
          key: train.id,
          stopTime: stopTime,
          trainNum: train.trainNum,
          stopDateTime: stopDateTime,
          stationId: nextProps.id
        })
      } else {
        return (
          null
        )
      }
    });
    this.setState({ stops: stop_times }, console.log(this.state))
  }

  componentDidMount() {
    this.isCurrentStationFavorite();
    console.log("did mount")
  }

  // getDefaultProps() {
  //   console.log("get default props")
  // }
  //
  // getInitialState() {
  //   console.log("get initial state");
  // }

  componentWillMount() {
    console.log("will mount");
  }

  handleFavoriteStationToggle() {
    this.fetchFavorite("true");
  }

  isCurrentStationFavorite() {
    this.fetchFavorite("false");
  }

  fetchFavorite(toggleFav) {
    fetch(`/api/v1/users/toggle_favorite_station?station=${this.props.id}&toggle=${toggleFav}&line=${this.props.line}`, { credentials: 'same-origin' })
    .then(response => response.json())
    .then(body => {
      this.setState({ favorite: body });
    });
  }

  componentWillUpdate() {
    console.log("will update");
  }
  render() {
    console.log("render");
    let stop_times = this.state.stops.map((stop, index) => {
      if (stop) {
        return(
          <TrainStopStamp
          key = {index}
          stationId = {stop.stationId}
          trainNum = {stop.trainNum}
          stopDateTime = {stop.stopDateTime}
          stopTime = {stop.stopTime}
          />
        )
      } else {
        return (
          <TrainStopStamp key={index} />
        )
      }
    })
    let favIcon;
    let favClass;
    if (this.state.favorite) {
      favIcon = <img className="fav-star" src={assetHelper["gold-star-icon"]} height="25px" width="25px"></img>
      favClass = " favorite"
    } else {
      favIcon = <img className="fav-star" src={assetHelper["black-star-icon"]} height="25px" width="25px"></img>
      favClass = ""
    }
    return(
      <tr>
        <th onClick={ this.handleFavoriteStationToggle } className={`schedule-header-row ${favClass}`}>{this.props.name}{ favIcon }</th>
        { stop_times }
      </tr>
    )
  }
}

export default StationScheduleRow;
