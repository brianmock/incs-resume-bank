class ChangeGradePrefAndLocationPrefColumnForUser < ActiveRecord::Migration
  def change
    change_column :users, :grade_pref, :text, array: true, default: [], using: "(string_to_array(grade_pref, ','))"
    change_column :users, :location_pref, :text, array: true, default: [], using: "(string_to_array(location_pref, ','))"
  end
end
