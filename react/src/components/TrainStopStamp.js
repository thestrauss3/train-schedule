import React, { Component } from 'react';

const TrainStopStamp = props => {
  return (
    <td className="schedule schedule-square">
      { props.stopTime }
    </td>
  )
}

export default TrainStopStamp;
