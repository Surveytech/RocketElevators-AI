require 'open_weather'
require "json"
module ElevatorMedia
    class Streamer

        # @streamer = Streamer.new

        def getContent(city = nil, lat = nil, lng = nil)
            # options = { units: "metric", APPID: ENV['OPEN_WEATHER_API'] }

            if ((city != nil) || (lat != nil && lng != nil))
                weather = self.getWeather(city, lat, lng)
                puts "======================================================"
                puts weather
                puts "======================================================"
            else 
                puts 'Error parameters are not supported' 
            end

            # Check in the response if there is a
        #    if weather["cod"] == 404
        #         puts "Error 404 getting the weather"
        #    else

            html = "<body><div> #{weather['weather']}, this is a great test!</div></body>"

            # weather = self.getWeather(params)
            
            # Convert the response to json °C
            # response = JSON.parse(weather)
            puts html
            return html
        end

        def getWeather(city = nil, lat = nil, lng = nil)
            options = { units: "metric", APPID: ENV['OPEN_WEATHER_API'] }
            if !(city.nil?)
                # get current weather by city name
                weather = OpenWeather::Current.city("#{city}", options)
            elsif !(lat.nil? && lon.nil?)
                # get current weather by position (latitude,longitude)
                weather = OpenWeather::Current.geocode(lat, lng, ENV['OPEN_WEATHER_OPTIONS'])
            else
                puts 'Error getting the weather!'
            end
            weather 
            # = Json.parse(weather.to_json)
            #render :json => weather.to_json
        end
    end
end