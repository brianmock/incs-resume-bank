class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true # validate owner's name is present, need to add validation for content-type
  belongs_to :teacher, class_name: "User", foreign_key: "teacher_id"
end
