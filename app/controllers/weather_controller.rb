# include ActionView::Layouts
# include ActionController::Rendering
class WeatherController < ApplicationController

    def index 
        @streamer = ElevatorMedia::Streamer.new
        # render inline: '<em>Hello, World!</em>'
        # render '_weather'
        
    end

    def getContent
        # puts params[:content][:city]
        # let!(:streamer){ElevatorMedia::Streamer.new}
        @streamer = ElevatorMedia::Streamer.new
        # weather = @streamer.getWeather(city)
        # html = @streamer.getContent(params[:city])
        puts params
        # puts params[:getWeather][:city]
        city = params[:city]
        if !(city.nil?)
           html = @streamer.getContent(city)
        else
            html = ""
        end
        # render html: "<strong>Not Found</strong>".html_safe
         puts '======================================================'
         puts html.html_safe

         if request.xhr?
            respond_to do |format|
                format.html {
                    render html: html
                }
            end
        end
        # puts html.html_safe
        # render component: 'Weather', props: {weather: html}
        # render html: html
        # render html: "#{html.html_safe}"

        # render html: helpers.tag.strong('Not Found')
        # respond_to do |format|
        #     # format.render :json => weather.to_json
        #     format.html {render html: "#{weather.html_safe}".html_safe}
        # end
        # html = "<html><head></head><body><h1>Holololo</h1></body></html>".html_safe
        # render plain: { hello: 'world' }.to_json, content_type: 'application/json'
        # respond_to do |format|
        #     format.html {render html: html, :content_type => 'text/html'}
            
        #   end

        # respond_to do |format|
        #     format.html { render layout: 'application' } # this is for your html responses if you need to respond with html
        #     format.json { # this block will execute for your json requests
     
        #      html = render_to_string action: :index, layout: false, :formats => [:html]
        #      render json: {data: html}
        #   }
        # end
    end

    def getWeather(city)
        @streamer = ElevatorMedia::Streamer.new
        weather = @streamer.getWeather(city)
        # render :json => weather.to_json
        puts weather.to_json
    end
end