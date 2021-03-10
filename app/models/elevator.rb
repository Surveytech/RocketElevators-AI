require 'httparty'

class Elevator < ApplicationRecord
    include ActiveModel::Dirty
    belongs_to :column
    
    
    before_update :sendMsg
    
    def getElevator
        return "Elevator(self.id)"
    end
    
    private
    def sendMsg
        if self.status_changed?
            
            
            url = ENV['SLACK_URL']
            msg = "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
            HTTParty.post(url, body: {"text":"#{msg}"}.to_json)
        end 
        
    end
end