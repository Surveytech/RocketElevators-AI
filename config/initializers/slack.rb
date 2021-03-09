#!/usr/bin/ruby
require 'httparty'
class Slack

    def getElevator
       elevator = Elevator.first
    #    elevatorid = elevator.id
       sendMsg(elevator)
    end

    def sendMsg(elevator)
        url = ENV['SLACK_URL']
        msg = "The Elevator #{elevator.id} with Serial Number #{elevator.serial_number} changed status from Active to Inactive"
        HTTParty.post(url, body: {"text":"#{msg}"}.to_json)
    end

end