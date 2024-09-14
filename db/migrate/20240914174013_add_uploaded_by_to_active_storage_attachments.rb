class AddUploadedByToActiveStorageAttachments < ActiveRecord::Migration[7.1]
  def change
    add_reference :active_storage_attachments, :uploaded_by, foreign_key: { to_table: :users }
  end
end
