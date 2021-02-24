class Address < ApplicationRecord
    def formatted_address
        "#{self.address_street_name} #{self.address_city}"
    end
end
