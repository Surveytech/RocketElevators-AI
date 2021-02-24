class ControllerpgRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :"controllerpg_#{Rails.env}"
end
