import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Streamer from "../components/elevator_media/Streamer";
import GetWeather from "../components/elevator_media/GetWeather"

export default (
  <Router>
    <Switch>
      <Route path="/test" exact component={Streamer} />
      <Route path="/getWeather" exact component={GetWeather} />
    </Switch>
  </Router>
);