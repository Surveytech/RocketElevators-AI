class Building < ApplicationRecord
    belongs_to :customer, dependent: :destroy
end
