class Customer < ApplicationRecord
    has_one :user, optional: true
    has_one :address
end
