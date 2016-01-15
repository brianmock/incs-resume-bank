class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :source, index: true

      t.timestamps null: false
    end
  end
end
