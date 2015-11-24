class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
