class Resume < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  validates :name, presence: true # validate owner's name is present, need to add validation for content-type
end
