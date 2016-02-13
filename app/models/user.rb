require 'csv'

class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email
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


  def is_active?
    if self.resumes.select {|res| res.active == true}.empty?
      return false
    else
      return true
    end
  end

  def self.to_csv(results)
    attributes = ['prefix', 'first_name', 'last_name', 'email', 'phone_number', 'street', 'street_second', 'city', 'state', 'zip', 'country', 'register', 'il_licensed', 'degree', 'major', 'masters_concentration', 'years', 'grade_pref', 'previous','location_pref', 'additional']
    headers = ['Prefix', 'First Name', 'Last Name', 'Email', 'Phone', 'Address 1', 'Address 2', 'City', 'State', 'Zip', 'Country', 'Registered?', 'IL License', 'Degree', 'Major', 'Masters Concentration', 'Years of Experience', 'Grade Preference', 'Previous Charter Work?', 'Location Preference', 'Additional Info', 'Positions Desired', 'Licenses Held', 'Subjects Desired', 'Reference Sources']

    CSV.generate(headers: true) do |csv|
      csv << headers
      results.each do |teacher|
        array = attributes.map{|attr| teacher.send(attr) }
        array << teacher.positions.pluck(:title).join(',')
        array << teacher.licenses.pluck(:name).join(',')
        array << teacher.subjects.pluck(:subject).join(',')
        array << teacher.sources.pluck(:souce_name).join(',')
        # array << teacher.resumes.first.attachment.url
        csv << array
      end
    end
  end

end
