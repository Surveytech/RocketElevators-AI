require "json"
module ElevatorMedia
    class Streamer   
        # @streamer = Streamer.new
        

        def getContent(city)
            client = OpenWeather::Client.new
            weather = client.current_weather(city: "#{city}")
            # puts weather
            response = JSON.parse(weather.to_json)
            # a = response["weather"].JSON.stringify(Object.assign({}, arr));
            puts '=-0=-=-=0=-0=-0=-0=-0=-0=-0'
            puts response['weather']
            html = "
                <div class='row wow slideInUp' data-wow-duration='1s'>
                <div class='col-md-4 col-md-offset-4'> 
                <h2 class='fw-600 fs-36 font-roboto' style='text-align: center'>
                <img src='#{response['weather'][0]['icon_uri']}' alt='weather_ico'><br />
                It feels like #{response['main']['feels_like']}°C in #{response['name']} 
                </h2>
                </div>
                </div>".html_safe
        
        
        end

        # def getContent(city = nil, lat = nil, lng = nil)
        #     # options = { units: "metric", APPID: ENV['OPEN_WEATHER_API'] }

        #     if ((city != nil) || (lat != nil && lng != nil))
        #         weather = self.getWeather(city, lat, lng)
        #         puts "======================================================"
        #         puts weather
        #         puts "======================================================"
        #     else 
        #         puts 'Error parameters are not supported' 
        #     end

        #     # Check in the response if there is a
        # #    if weather["cod"] == 404
        # #         puts "Error 404 getting the weather"
        # #    else
        #     response = JSON.parse(weather.to_json)
        #     # response = response.to_json
        #     puts response['main']['feels_like']
        #     # puts response['description']
        #     # weather2 = weather1["main"]
        #     html = "<h2>It feels like #{response['main']['feels_like']}°C in #{city} </h2>".html_safe
        #     # html = "hey"
        #     # weather = self.getWeather(params)
            
        #     # Convert the response to json °C
        #     # response = JSON.parse(weather)
        #     # puts html
        #     # return html
        # end

        def getWeather(city = nil, lat = nil, lng = nil)
            options = { units: "metric", APPID: ENV['OPEN_WEATHER_API'] }
            if !(city.nil?)
                # get current weather by city name
                weather = OpenWeather::Current.city(city, options)
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