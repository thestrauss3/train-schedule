import React, { Component } from 'react';

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

  getStopTimes(train_ids) {

  }
  render() {
    let stop_times = this.props.trains.map(train =>{
      return(
        <p>Hello</p>
      )
    });
    return(
      <tr>
        <th>{this.props.name}</th>
      </tr>
    )
  }
}

export default StationScheduleRow;
