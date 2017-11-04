class AddAccessIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :access
  end
end
