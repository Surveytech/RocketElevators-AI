class WeatherController < ApplicationController

    def index 
        @streamer = ElevatorMedia::Streamer.new   
    end

    def getContent
        @streamer = ElevatorMedia::Streamer.new
        city = params[:city]
        if !(city.nil?)
           html = @streamer.getContent(city)
        else
            html = ""
        end

        if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        end
    end

    def getWeather(city)
        @streamer = ElevatorMedia::Streamer.new
        weather = @streamer.getWeather(city)
        # render :json => weather.to_json
        puts weather.to_json
    end
end