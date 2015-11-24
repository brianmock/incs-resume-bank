class CreateEndorsementsCompleteds < ActiveRecord::Migration
  def change
    create_table :endorsements_completeds do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :endorsement, index: true

      t.timestamps null: false
    end
  end
end
