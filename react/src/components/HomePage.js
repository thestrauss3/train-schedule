import React, { Component } from 'react';
import { Link } from 'react-router';

const HomePage = props => {
  return (
      <div>
        <h1>Welcome to Train Spotter</h1>
        <ul>
        <Link to={`/train_lines`}>See all of Bostons super awesome incrdbly time train schedulings</Link>
        </ul>
      </div>
  )
}

export default HomePage;
