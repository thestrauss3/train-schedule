import React, { Component } from 'react';
import { Link } from 'react-router';

const HomePage = props => {
  return (
      <div className="home">
        <h1>Welcome to Train Spotter</h1><br/>
        <ul>
          <Link to={`/routes`}>Boston Transportation</Link>
        </ul>
        <br/><br/>
        <p>Train Spotter is currently still being built up to it's full capabilities.
        Soon this landing page will provide links to schedules for trains all over
        the US in major cities. Currently only Boston is available, but more schedules
        will be added soon.</p>
      </div>
  )
}

export default HomePage;
