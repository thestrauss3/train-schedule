import React, { Component } from 'react';

class TrainStopStamp extends Component {
  constructor(props) {
    super(props);

    this.state = {
      time: ""
    };
  }

  componentDidMount() {
    let train_id = this.props.train_id;
    let station_id = this.props.station_id;
    fetch(`/api/v1/stations/${station_id}/trains/${train_id}/train_stops`)
    .then(response => response.json())
    .then(body => {
      this.setState({
        time: body
      });
    });
  }

  render() {
    return (
      <td>
        { this.state.time }
      </td>
    )
  }
}

export default TrainStopStamp;
