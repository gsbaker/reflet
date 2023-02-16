class AddNeedStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :need_statuses do |t|
      t.references :need
      t.references :user
      t.integer :status, default: 0
    end
  end
end
