class AddUserLevelToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_level, :integer, default: 0, null: false
  end
end
