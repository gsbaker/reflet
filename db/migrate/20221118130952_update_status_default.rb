class UpdateStatusDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :needs, :status, :string, default: nil
  end
end
