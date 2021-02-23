class CreateDgKleads < ActiveRecord::Migration[5.2]
  def change
    create_table :dg_kleads do |t|
      t.string :fullNameOfTheContact
      t.string :companyName
      t.string :email
      t.string :phone
      t.string :projectName
      t.string :projectDescription
      t.string :departmentInChargeOfTheElevators
      t.string :message
      t.binary :attachedFileStoredAsABinaryFile
      t.datetime :dateOfTheContactRequest

      t.timestamps
    end
  end
end
