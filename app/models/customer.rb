class Customer < ApplicationRecord
    has_one :user
    has_one :address
    has_many :building
end
