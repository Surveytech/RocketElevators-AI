require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    # context 'test for empty string' do
    #     it 'return nothing' do
    #         expect(streamer.getContent("")).to eq(0)
    #     end
    # end

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
