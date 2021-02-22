class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.bigint :battery_id, null: false
      t.string :building_type, null: false
      t.integer :number_of_floors_served, null: false
      t.string :status, null: false
      t.string :information, null: false
      t.string :notes, null: false

      t.timestamps null: false
    end
  end
end
