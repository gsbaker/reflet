class UpdateNeedStatusDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :needs, :status, 0
  end
end
