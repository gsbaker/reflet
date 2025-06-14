class AddTitleToContracts < ActiveRecord::Migration[8.0]
  def change
    add_column :contracts, :title, :string, null: false, default: "Therapy Contract"
  end
end
