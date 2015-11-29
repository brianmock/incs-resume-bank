class User < ActiveRecord::Base
  has_secure_password
  has_many :resumes, foreign_key: "teacher_id"
  has_many :licenses_helds, foreign_key: "teacher_id"
  has_many :licenses, through: :licenses_helds
  has_many :memberships, foreign_key: "teacher_id"
  has_many :organizations, through: :memberships
  has_many :position_choices, foreign_key: "teacher_id"
  has_many :positions, through: :position_choices
  has_many :endorsements_completed, foreign_key: "teacher_id"
  has_many :endorsements, through: :endorsements_completed
  has_many :preferences, foreign_key: "teacher_id"
  has_many :subjects, through: :preferences


  def is_active?
    if self.resumes.select {|res| res.active == true}.empty?
      return false
    else
      return true
    end
  end
end
