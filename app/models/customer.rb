class Customer < ApplicationRecord
    has_one :user
    belongs_to :address
end
