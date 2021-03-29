require 'open_weather'
# require "json"
module ElevatorMedia
    class Streamer

        def getContent(input)
            0
        end

        def getWeather(city)
            options = { units: "metric", APPID: ENV['OPEN_WEATHER_API'] }
            # get current weather by city name
            weather = OpenWeather::Current.city("#{city}", options)
            puts weather
            weather
            # render :json => weather.to_json
        end
    end
end