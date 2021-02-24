class DropRailsAdminSettingsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :rails_admin_settings
  end
end
