class AddUserIdToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :user_id, :integer
  end
end
