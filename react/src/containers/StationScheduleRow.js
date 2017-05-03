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
    this.getStopTimes(train_ids);
  }

  render() {
    let stop_times = this.props.trains.map(train =>{
      return(
        <TrainStopStamp
          key = { train.id }
          train_id = { train.id }
          station_id = { this.props.id }
        />
      )
    });

    return(
      <tr>
        <th>{this.props.name}</th>
        {stop_times}
      </tr>
    )
  }
}

export default StationScheduleRow;
