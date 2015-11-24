class CreateLicensesHelds < ActiveRecord::Migration
  def change
    create_table :licenses_helds do |t|
      t.belongs_to :license, index: true
      t.belongs_to :teacher, index: true

      t.timestamps null: false
    end
  end
end
