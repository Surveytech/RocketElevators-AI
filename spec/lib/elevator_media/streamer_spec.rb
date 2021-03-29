require 'elevator_media/streamer.rb'
require 'rails_helper'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    context 'test for empty string' do
        it 'return nothing' do
            expect(streamer.getContent("")).to eq(0)
        end
    end

end
