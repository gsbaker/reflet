class CreateNeeds < ActiveRecord::Migration[7.0]
  def change
    create_table :needs do |t|
      t.string :title
      t.string :group
      t.string :category

      t.timestamps
    end
  end
end
