class MapsController < ApplicationController

    def index
         @buildings = Building.all.to_json
         @addresses = Address.all.to_json
        # @buildings = Building.all
        #   @buildings.each do |building|
        #     address = Address.find(building.address_id)
        #     address.longitude
        #     address.latitude
        #   end
    end

    def findLocation

    end



end
