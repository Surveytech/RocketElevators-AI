class RenameElevatorsDateOfCommissioning < ActiveRecord::Migration[5.2]
  def change
    rename_column :elevators, :date_of_comissioning, :date_of_commissioning 
  end
end
