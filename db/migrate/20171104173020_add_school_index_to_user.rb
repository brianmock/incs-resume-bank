class AddSchoolIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :school
  end
end
