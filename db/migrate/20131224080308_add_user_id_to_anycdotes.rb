class AddUserIdToAnycdotes < ActiveRecord::Migration
  def change
    add_column :anycdotes, :user_id, :integer
    add_index :anycdotes, :user_id
  end
end
