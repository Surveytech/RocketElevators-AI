class Building < ApplicationRecord
    belongs_to :customer
    # has_one :address, optional: true
    # has_one :building_details, optional: true
end
