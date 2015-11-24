class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :organization, index: true
      t.timestamps null: false
    end
  end
end
