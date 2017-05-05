import React, { Component } from 'react';
import TrainStopStamp from './TrainStopStamp';

class StationScheduleRow extends Component {
  constructor(props) {
    super(props)

    this.state = {
      stops: []
    }
  }

  componentDidMount() {
    let train_ids = this.props.trains.map(train => {
      return(
        train.id
      )
    })
    // this.getStopTimes(train_ids);
  }

  render() {
    let stop_times = this.props.trains.map(train =>{
      let train_stop = train.stops.filter((stop) => {
        return stop.stop_id == this.props.id
      }, this)
      if (train_stop[0]) {
        let stopDateTime = new Date(train_stop[0].sch_arr_dt * 1000)
        let hours = stopDateTime.getHours()
        let minutes = stopDateTime.getMinutes()
        minutes = minutes < 10 ? '0'+minutes : minutes;
        let stopTime = hours + ":" + minutes
        return(
          <TrainStopStamp
            key = { train.id }
            trainNum = { train.trainNum }
            stationId = { this.props.id }
            stopDateTime = { stopDateTime }
            stopTime = { stopTime }
          />
        )
      } else {
        return (
          <TrainStopStamp />
        )
      }
    }, this);
    return(
      <tr>
        <th className="schedule-header-row">{this.props.name}</th>
        {stop_times}
      </tr>
    )
  }
}

export default StationScheduleRow;
