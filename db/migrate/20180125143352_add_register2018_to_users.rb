class AddRegister2018ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :register2018, :string
  end
end
