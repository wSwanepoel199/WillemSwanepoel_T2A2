class AddUsernameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, index: true
    add_index :users, :username, unique: true
  end
end
