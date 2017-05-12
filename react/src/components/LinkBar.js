import React, { Component } from 'react';
import { Link } from 'react-router';

const LinkBar = props => {
  let bar = props.links.map((link, index) => {
    return(
      <span key={index}><Link className="link-bar-link" to={link.url}>{link.location}</Link> > </span>
    )
  })
  return (
      <div>{bar}{props.currentPage}</div>
  )
}

export default LinkBar;
