class AddUserToNeed < ActiveRecord::Migration[7.0]
  def change
    add_reference :needs, :user
  end
end
