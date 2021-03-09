#!/usr/bin/ruby
require 'httparty'
class Slack

    def getElevator
       elevator = Elevator.first
    #    elevatorid = elevator.id
       sendMsg(elevator)
    end

    # def sendMsg(elevator)
    #     url = 'https://hooks.slack.com/services/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'
    #     msg = "The Elevator #{elevator.id} with Serial Number #{elevator.serial} changed status from #{[Old Status]} to #{[New Status]}"
    #     HTTParty.post(url, body: {"text":"#{msg}"}.to_json)
    # end

end