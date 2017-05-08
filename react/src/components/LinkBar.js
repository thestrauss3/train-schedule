'esversion: 6';

import React, { Component } from 'react';
import { Link } from 'react-router';

const LinkBar = props => {
  let bar = props.links.map((link) => {
    return(
      <Link to={link.url}>{link.name}</Link>
    )
  })
  return (
      <div>{bar}</div>
  )
}

export default LinkBar;
