class LicensesHeld < ActiveRecord::Base
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
  belongs_to :license
end
