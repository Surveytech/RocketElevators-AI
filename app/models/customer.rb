class Customer < ApplicationRecord
    has_one :user
    has_many :building
end
