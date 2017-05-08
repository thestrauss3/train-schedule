'esversion: 6';

import React, { Component } from 'react';
import { Link } from 'react-router';

const LinkBar = props => {
  let bar = props.links.map((link, index) => {
    return(
      <span><Link to={link.url} key={index}>{link.location}</Link> &nbsp; > &nbsp; </span>
    )
  })
  return (
      <div>{bar}{props.currentPage}</div>
  )
}

export default LinkBar;
