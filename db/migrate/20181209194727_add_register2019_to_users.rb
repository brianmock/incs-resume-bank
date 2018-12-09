class AddRegister2019ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :register2019, :string
  end
end
