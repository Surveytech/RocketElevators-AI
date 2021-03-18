class Building < ApplicationRecord
    belongs_to :customer, optional: true
    has_one :address
    has_many :batteries
    has_many :columns
    has_many :elevators
    has_many :fact_interventions
    has_many :building_details
end
