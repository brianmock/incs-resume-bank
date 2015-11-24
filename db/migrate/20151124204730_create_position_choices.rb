class CreatePositionChoices < ActiveRecord::Migration
  def change
    create_table :position_choices do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :position, index: true

      t.timestamps null: false
    end
  end
end
