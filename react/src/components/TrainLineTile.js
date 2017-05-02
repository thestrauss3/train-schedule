import React, { Component } from 'react';
import { Link } from 'react-router';

const TrainLineTile = props => {
  return (
      <div>
        <Link to={`/train_lines/${props.id}`}>{props.name}</Link>
      </div>
  )
}

export default TrainLineTile;
