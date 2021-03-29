import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Streamer from "../components/elevator_media/Streamer";

export default (
  <Router>
    <Switch>
      <Route path="/test" exact component={Streamer} />
    </Switch>
  </Router>
);