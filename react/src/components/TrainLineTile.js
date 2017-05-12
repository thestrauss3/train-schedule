import React, { Component } from 'react';
import { Link } from 'react-router';

const TrainLineTile = props => {
  return (
      <div className="train-line-button">
        <Link to={`/train_lines/${props.id}`}><button className="button" >{props.name}</button></Link>
      </div>
  )
}

export default TrainLineTile;
