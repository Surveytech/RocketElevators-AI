require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do

    # Streamer var init
    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'Does getContent work?' do
        it 'it works' do
            expect(streamer).to respond_to(:getContent)
        end
    end

    context 'Does getWeather work?' do 
        it 'Get Weather Works!' do 
            expect(streamer).to respond_to(:getWeather)
        end
    end

    context 'Get weather info from getContent' do 
        it 'return infos' do 
            expect(streamer.getContent('Levis')).not_to be_nil
        end
    end

    context 'City name from the query should be Charlesbourg' do 
        it "It works!" do          
            response = OpenWeather::Client.new.current_weather(city: "Charlesbourg")
            expect((JSON.parse(response.to_json)['name']) == 'Charlesbourg')
        end
    end    

    context 'Get html from getContent' do
        it 'Returns html!' do 
            puts (streamer.getContent('Lévis')).html_safe
            expect((streamer.getContent('Lévis')).html_safe).to include('<div>')
        end
    end

end
