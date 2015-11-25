class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :school
      t.string :prefix
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :street
      t.string :street_second
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :register
      t.string :il_licensed
      t.string :degree
      t.string :major
      t.string :masters_concentration
      t.string :years
      t.string :grade_pref
      t.boolean :previous
      t.boolean :relocation
      t.string :password_digest
      t.string :access
      t.string :additional

      t.timestamps null: false
    end
  end
end
