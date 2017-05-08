'esversion: 6';

import React, { Component } from 'react';

const BranchDropDown = props => {
  let choices = props.branches.map((b) => {
    return(
      <option >{b}</option>
    )
  })
  return (
    <div class="dropdown">
      <select onChange={props.onChange}>
        {choices}
      </select>
    </div>
  )
}

export default BranchDropDown;
