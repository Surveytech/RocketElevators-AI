class DropAttachmentTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :attachment_binaries
    drop_table :attachments
  end
end
