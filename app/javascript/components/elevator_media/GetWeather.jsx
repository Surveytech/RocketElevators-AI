import React, { Component } from "react";
import { render } from "react-dom";
import axios from 'axios'
import { Link } from "react-router-dom";

class GetWeather extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            latitude: "",
            longitude: "",
            city: ""
        };  
        this.getPosition = this.getPosition.bind(this);
        this.onSubmit = this.onSubmit.bind(this);   
        this.onChange = this.onChange.bind(this);
    }

    // getPosition(event) {
    //     navigator.geolocation.getCurrentPosition(function(position) {
    //         console.log("Latitude is :", position.coords.latitude);
    //         console.log("Longitude is :", position.coords.longitude);
    //     });
    // }

    onChange(event) {
        this.setState({ [event.target.name]: event.target.value });
      }

    getPosition(event) {
        event.preventDefault();
        // let latitude = position.coords.latitude;
        // let longitude = position.coords.longitude;

        this.state = navigator.geolocation.getCurrentPosition(function(position) {let latitude = position.coords.latitude; let longitude = position.coords.longitude});
        // navigator.geolocation.getCurrentPosition(function(position) {
        //     console.log("Latitude is :", position.coords.latitude);
        //     console.log("Longitude is :", position.coords.longitude);
        //     // var latitude = position.coords.latitude
        //     // var longitude = position.coords.longitude
        //     // const this.state =
        //     // const { latitude = position.coords.latitude, longitude = position.coords.longitude } = this.state
        //     return(position.coords.latitude, position.coords.longitude)
        // });


        // console.log (navigator.geolocation.getCurrentPosition.coords.latitude)
        // var longitude = navigator.geolocation.getCurrentPosition.coords.longitude

        // let {
        //     latitude = navigator.geolocation.getCurrentPosition.coords.latitude, 
        //     longitude = navigator.geolocation.getCurrentPosition.coords.longitude
        // } = this.state

        const url = "/getWeather";
        // const { latitude, longitude } = this.state
        // this.state = {latitude, longitude}

        if (latitude.length == 0 || longitude.length == 0)
            return;

        const body = {
            latitude,
            longitude
        };

        const token = document.querySelector('meta[name="csrf-token"]').content;
      fetch(url, {event
      })
        .then(response => {
          if (response.ok) {
            return response.json();
          }
          throw new Error("Network response was not ok.");
        })
        .then(response => this.props.history.push(`/weather`))
        .catch(error => console.log(error.message));
    }

    onSubmit(event) {
        event.preventDefault();
        const url = "/getWeather";
        const { city } = this.state

        if (city.length == 0)
            return;

        const body = {city};

        const token = document.querySelector('meta[name="csrf-token"]').content;
      fetch(url, {
        method: "POST",
        headers: {
          "X-CSRF-Token": token,
          "Content-Type": "application/json"
        },
        body: JSON.stringify(body)
      })
        .then(response => {
          if (response.ok) {
            return response.json();
          }
          throw new Error("Network response was not ok.");
        })
        .then(response => this.props.history.push(`/weather`))
        .catch(error => console.log(error.message));
    }
    render() {
        return (
          <div className="container mt-5">
            <div className="row">
              <div className="col-sm-12 col-lg-6 offset-lg-3">
                <h1 className="font-weight-normal mb-5">
                  Create a new employee.
                </h1>

                <button onClick={this.getPosition}>Get Position</button>

                <form onSubmit={this.onSubmit}>                 
                  <div className="form-group">
                    <label htmlFor="city">Enter the desired city</label>
                    <input
                      type="text"
                      name="city"
                      id="city"
                      className="form-control"
                      required
                      onChange={this.onChange}
                    />
                  </div>
                  <button type="submit" className="btn custom-button mt-3">
                    Request Weather
                  </button>
                </form>
              </div>
            </div>
          </div>
        );
      }
}

export default GetWeather;