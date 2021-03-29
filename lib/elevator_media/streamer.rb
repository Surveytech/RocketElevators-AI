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
        end
    end
end