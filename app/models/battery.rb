class Battery < ApplicationRecord
    belongs_to :building
    has_many :columns, dependent: :destroy
end
