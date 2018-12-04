require 'csv'

class User < ActiveRecord::Base
  attr_accessor :password_confirmation, :email_confirmation

  has_secure_password
  validates_uniqueness_of :email
  validates_confirmation_of :password, on: :create
  validates_confirmation_of :email, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_presence_of :email_confirmation, on: :create
  validates :email, presence: { message: "Email can't be blank" }
  validates :first_name, presence: { message: "First name can't be blank" }
  validates :last_name, presence: { message: "Last name can't be blank" }
  with_options if: :is_teacher? do |teacher|
    teacher.validates :zip, presence: { message: "Zip code can't be blank" }
    teacher.validates :years, presence: { message: "Years of experience can't be blank" }
    teacher.validates :il_licensed, presence: { message: "IL license status can't be blank" }
    teacher.validates :licenses_helds, presence: { message: "Add your currently held licenses" } 
    teacher.validates :position_choices, presence: { message: "Add your desired position(s)" } 
    teacher.validates :endorsements_completed, presence: { message: "Add your completed endorsements" } 
  end
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
  has_many :references, foreign_key: "teacher_id"
  has_many :sources, through: :references

  scope :with_active_resumes, -> { joins(:resumes).where('resumes.active = true') }

  def is_teacher?
    self.access == 'teacher'
  end

  def is_active?
    !self.resumes.select { |res| res.active == true }.empty?
  end

  def self.teacher_search(search)
    where("access = ? AND CONCAT_WS(' ', lower(first_name), lower(last_name)) LIKE ?", "teacher", "%#{search.downcase}%")
  end

  def self.school_search(search)
    where("access = ? AND lower(school) LIKE ?", "school", "%#{search.downcase}%")
  end

  def self.school_to_csv(results)
    attributes = ['first_name', 'last_name', 'email','school','created_at']
    headers = ['First Name', 'Last Name', 'Email', 'School', 'Created At']

    CSV.generate(headers: true) do |csv|
      csv << headers
      results.each do |teacher|
        array = attributes.map{ |attr| teacher.send(attr) }
        csv << array
      end
    end
  end

  def self.to_csv(results)
    attributes = ['prefix', 'first_name', 'last_name', 'email', 'phone_number', 'street', 'street_second', 'city', 'state', 'zip', 'country', 'register', 'register2017', 'register2018', 'il_licensed', 'degree', 'major', 'masters_concentration', 'years', 'grade_pref', 'previous', 'location_pref', 'additional', 'created_at']
    headers = ['Prefix', 'First Name', 'Last Name', 'Email', 'Phone', 'Address 1', 'Address 2', 'City', 'State', 'Zip', 'Country', 'Registered 2016?', 'Registered 2017?', 'Registered 2018?', 'IL License', 'Degree', 'Major', 'Masters Concentration', 'Years of Experience', 'Grade Preference', 'Previous Charter Work?', 'Location Preference', 'Additional Info', 'Registered On', 'Positions Desired', 'Licenses Held', 'Subjects Desired', 'Reference Sources']

    CSV.generate(headers: true) do |csv|
      csv << headers
      results.each do |teacher|
        array = attributes.map { |attr| teacher.send(attr) }
        array << teacher.positions.pluck(:title).join(',')
        array << teacher.licenses.pluck(:name).join(',')
        array << teacher.subjects.pluck(:subject).join(',')
        array << teacher.sources.pluck(:source_name).join(',')
        # array << teacher.resumes.first.attachment.url
        csv << array
      end
    end
  end
end
