import React from 'react';
import ReactOnRails from 'react-on-rails';

import HelloWorldWidget from '../components/HelloWorldWidget';

const HelloWorldApp = (props) => (
  <HelloWorldWidget {...props} />
);

// This is how react_on_rails can see the HelloWorldApp in the browser.
ReactOnRails.register({ HelloWorldApp });