class Elevator < ApplicationRecord
    belongs_to :column

    after_update :check_intervention


    private
        def check_intervention
            if self.status == 'Intervention'
                account_sid = ENV['ACCOUNT_SID_TWILIO']
                auth_token = ENV['AUTH_TOKEN_TWILIO']
                @client = Twilio::REST::Client.new(account_sid, auth_token)
                column = Column.find(self.column_id)
                battery = Battery.find(column.battery_id)
                building = Building.find(battery.building_id)
                name = building.building_technical_full_name
                phone = ENV['PHONE_NUMBER']
                
                message = @client.messages.create(
                    body: "Hi #{name} the elevator with id #{self.id} and serial_number #{self.serial_number} is in Intervention",
                    from: '+14508040066',
                    to: phone
                )
            end
        end
end
