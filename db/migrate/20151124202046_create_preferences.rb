class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :subject, index: true

      t.timestamps null: false
    end
  end
end
