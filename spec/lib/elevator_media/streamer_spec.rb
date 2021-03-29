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

    context 'Get weather info' do 
        it 'return infos' do 
            expect(streamer.getWeather('Levis')).not_to be_nil
        end
    end

end
