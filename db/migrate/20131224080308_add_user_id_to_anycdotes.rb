class AddUserIdToAnycdotes < ActiveRecord::Migration
  def change
    add_column :anycdotes, :user_id, :string
    add_column :anycdotes, :integer, :string
    add_index :anycdotes, :integer
  end
end
