class AddColumnUserIdToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :username
    add_column :comments, :user_id, :integer
  end
end
