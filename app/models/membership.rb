class Membership < ActiveRecord::Base
  belongs_to :organization
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
end
