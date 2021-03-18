class FactIntervention < ApplicationRecord
    belongs_to :building
    belongs_to :employee
    establish_connection(:postgresDB)
    self.table_name = "fact_interventions"
end
