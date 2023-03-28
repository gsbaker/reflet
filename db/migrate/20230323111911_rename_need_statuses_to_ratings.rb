class RenameNeedStatusesToRatings < ActiveRecord::Migration[7.0]
  def change
    rename_table :need_statuses, :ratings
  end
end
