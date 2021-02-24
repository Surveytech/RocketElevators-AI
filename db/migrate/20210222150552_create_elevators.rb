class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.bigint :column_id, null: false
      t.bigint :serial_number, null: false
      t.string :model_type, null: false
      t.string :building_type, null: false
      t.string :status, null: false
      t.datetime :date_of_commissioning, null: false
      t.datetime :date_of_last_inspection, null: false
      t.string :certificate_of_operations, null: false
      t.string :information, null: false
      t.string :notes, null: false

      t.timestamps null: false

    end
  end
end
