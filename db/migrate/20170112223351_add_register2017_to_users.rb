class AddRegister2017ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :register2017, :string
  end
end
