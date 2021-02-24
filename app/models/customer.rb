class Customer < ApplicationRecord
    has_one :users
    has_many :building
end
