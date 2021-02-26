class Address < ApplicationRecord
    belongs_to :building, optional: true
    belongs_to :customer, optional: true
    # def formatted_address
    #     "#{self.number_and_street} #{self.city}"
    # end
end
