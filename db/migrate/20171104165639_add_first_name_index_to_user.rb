class AddFirstNameIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, [:first_name, :last_name]
  end
end
