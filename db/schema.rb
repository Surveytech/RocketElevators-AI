# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_24_141412) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "notes"
    t.string "entity"
    t.string "address_formatted_address"
    t.string "address_street_number"
    t.string "address_street_name"
    t.string "address_street"
    t.string "address_city"
    t.string "address_zip_code"
    t.string "address_department"
    t.string "address_department_code"
    t.string "address_state"
    t.string "address_state_code"
    t.string "address_country"
    t.string "address_country_code"
    t.float "address_lat"
    t.float "address_lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_addresses_on_building_id"
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", null: false
    t.string "status", null: false
    t.bigint "employee_id", null: false
    t.datetime "date_of_commissioning", null: false
    t.datetime "date_of_last_inspection", null: false
    t.string "certificate_of_operations", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_batteries_on_building_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "information_key", null: false
    t.string "information_value", null: false
    t.bigint "building_id"
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "building_address"
    t.string "building_admin_full_name", null: false
    t.string "building_admin_email", null: false
    t.string "building_admin_phone", null: false
    t.string "building_technical_full_name", null: false
    t.string "building_technical_email", null: false
    t.string "building_technical_phone", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "building_type", null: false
    t.integer "number_of_floors_served", null: false
    t.string "status", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "battery_id"
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "company_name", null: false
    t.string "company_address"
    t.string "company_contact_full_name", null: false
    t.string "company_phone", null: false
    t.string "company_email", null: false
    t.string "company_description", null: false
    t.string "service_technical_authority_full_name", null: false
    t.string "service_technical_authority_phone", null: false
    t.string "service_technical_authority_email", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.bigint "user_id"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "serial_number", null: false
    t.string "model_type", null: false
    t.string "building_type", null: false
    t.string "status", null: false
    t.datetime "date_of_comissioning", null: false
    t.datetime "date_of_last_inspection", null: false
    t.string "certificate_of_operations", null: false
    t.string "information", null: false
    t.string "notes", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "column_id"
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["first_name"], name: "index_employees_on_first_name"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "company_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "project_name", null: false
    t.string "project_description", null: false
    t.string "department_in_charge_of_the_elevators"
    t.string "message", null: false
    t.string "file_name"
    t.string "file_type"
    t.binary "file_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "building_type"
    t.integer "number_of_apartments"
    t.integer "number_of_floors"
    t.integer "number_of_basements"
    t.integer "number_of_companies"
    t.integer "number_of_parking_spots"
    t.integer "number_of_elevators"
    t.integer "number_of_corporations"
    t.integer "maximum_occupancy"
    t.string "product_line"
    t.float "elevator_unit_price"
    t.float "elevator_total_price"
    t.float "installation_price"
    t.float "total_price"
    t.string "company_name"
    t.time "business_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["name"], name: "index_quotes_on_name"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "surname"
    t.string "title"
    t.boolean "admin", default: false
    t.string "employee_id"
    t.bigint "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "addresses", "buildings"
  add_foreign_key "batteries", "buildings"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
  add_foreign_key "quotes", "users"
  add_foreign_key "users", "roles"
end
