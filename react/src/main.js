import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App';
import SecondApp from './components/SecondApp';


$(function() {
  ReactDOM.render(
    <App />,
    document.getElementById('app')
  );
});
