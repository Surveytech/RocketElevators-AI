class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.bigint :building_id, null: false
      t.string :type, null: false
      t.string :status, null: false
      t.bigint :employee_id, null: false
      t.datetime :date_of_comissioning, null: false
      t.datetime :date_of_last_inspection, null: false
      t.string :certificate_of_operations, null: false
      t.string :information, null: false
      t.string :notes, null: false

      t.timestamps null: false
    end
  end
end
