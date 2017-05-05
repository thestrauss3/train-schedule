import React, { Component } from 'react';

const ScheduleHeader = props => {
  return (
      <th className="schedule-header-column">{ props.num }</th>
  )
}

export default ScheduleHeader;
