'esversion: 6';

import React, { Component } from 'react';

const BranchDropDown = props => {
  let choices = props.branches.map((b) => {
    // debugger
    return(
      <option  id={`${b}`}>{b}</option>
    )
  })
  return (
    <div className="dropdown">
      <select onChange={props.onChange}>
        {choices}
      </select>
    </div>
  )
}

export default BranchDropDown;
