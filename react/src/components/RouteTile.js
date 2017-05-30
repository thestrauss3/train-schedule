import React, { Component } from 'react';
import { Link } from 'react-router';

const RouteTile = props => {
  return (
      <div className="route-button">
        <Link to={`/routes/${props.id}`}><button className="button" >{props.name}</button></Link>
      </div>
  )
}

export default RouteTile;
