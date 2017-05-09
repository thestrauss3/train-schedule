import React, { Component } from 'react';
import TrainStopStamp from '../components/TrainStopStamp';

class StationScheduleRow extends Component {
  constructor(props) {
    super(props)

    this.state = {
      stops: [],
      favorite: false
    }

    this.getStops = this.getStops.bind(this)
  }

  componentWillReceiveProps(nextProps) {
    this.getStops(nextProps)
  }

  getStops(nextProps) {
    let stop_times = nextProps.trains.trains.map(train =>{
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
    }, this);
    this.setState({ stops: stop_times })
  }

  componentDidMount() {
    this.isCurrentStationFavorite();
  }

  handleFavoriteStationToggle() {
    this.fetchFavorite("true");
  }

  isCurrentStationFavorite() {
    this.fetchFavorite("false");
  }

  fetchFavorite(toggleFav) {
    fetch(`/api/v1/users/toggle_favorite_station?station=${this.props.id}&toggle=${toggleFav}`, { credentials: 'same-origin' })
    .then(response => response.json())
    .then(body => {
      this.setState({ favorite: body });
    });
  }

  render() {
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
          <TrainStopStamp />
        )
      }
    })
    let favoriteIcon;
    if (this.state.favorite) {
      favoriteIcon = "heart"
    } else {
      favoriteIcon = "None"
    }
    return(
      <tr>
        <th onClick={ this.handleFavoriteStationToggle } className="schedule-header-row">{this.props.name}{favoriteIcon}</th>
        {stop_times}
      </tr>
    )
  }
}

export default StationScheduleRow;
