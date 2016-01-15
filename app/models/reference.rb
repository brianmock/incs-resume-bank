class Reference < ActiveRecord::Base
  belongs_to :source
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
end
