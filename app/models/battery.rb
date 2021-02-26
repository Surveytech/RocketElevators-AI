class Battery < ApplicationRecord
    has_many :columns, dependent: :destroy
    belongs_to :building
end
