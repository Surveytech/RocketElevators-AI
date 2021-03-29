# require '../../lib/elevator_media/streamer.rb'
# require '../../lib/elevator_media'
# include '../../lib/elevator_media'
# include ElevatorMedia
# require 'ElevatorMedia'
class MediaController < ApplicationController
    # include ElevatorMedia
    def getContent
        # let!(:streamer){ElevatorMedia::Streamer.new}
        @streamer = ElevatorMedia::Streamer.new
        puts @streamer
    end

end