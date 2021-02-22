class Battery < ApplicationRecord
    has_many :columns, dependent: :destroy
end
