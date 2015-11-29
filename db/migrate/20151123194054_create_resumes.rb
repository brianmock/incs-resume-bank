class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.belongs_to :teacher, index: true
      t.string :name
      t.string :attachment
      t.boolean :active

      t.timestamps null: false
    end
  end
end
