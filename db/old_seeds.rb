# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

positions = [
             "College Counselor",
             "Paraprofessional",
             "School Leader",
             "Social Worker",
             "Special Education",
             "Teacher"
            ]

positions.each do |pos|
  Position.create(title: pos)
end

orgs = [
        "AmeriCorps",
        "Teach For America",
        "City Year",
        "Education Pioneers",
        "Academy for Urban School Leadership",
        "Peace Corps",
        "Broad Residency in Urban Education",
        "Golden Apple",
        "Grow Your Own",
       ]

orgs.each do |org|
  Organization.create(name: org)
end

subs = [
        "Art",
        "Citizenship",
        "History",
        "French",
        "German",
        "Spanish",
        "Literacy",
        "Science",
        "Natural History",
        "Dance",
        "Drama",
        "English",
        "Geography",
        "Mathematics",
        "Modern Studies",
        "Physical Education",
        "Biology",
        "Chemistry",
        "Ethics",
        "Foreign Languages",
        "Health and Hygiene",
        "Latin",
        "Literature",
        "Music",
        "Physics",
        "Religion",
        "Sociology",
        "Psychology",
        "Home Economics",
        ]

subs.each do |sub|
  Subject.create(subject: sub)
end

licenses = [
            "None",
            "Professional Educator License (PEL)",
            "Educator License with Stipulations",
            "Substitute Teaching License",
           ]

licenses.each do |lic|
  License.create(name: lic)
end

endorse = [
            "None",
            "Bilingual Education",
            "Early Childhood (birth-grade 3)",
            "Elementary Education (K-9)",
            "Paraprofessional",
            "ESL Special Education",
            "Middle School Education",
            "Secondary Education (6 - 12)",
            "Special Education (Pk - Age 21)",
            "School Social Worker (Pk - Age 21)",
            "School Counselor (Pk - Age 21)",
          ]

endorse.each do |endo|
  Endorsement.create(name: endo)
end

User.create(first_name: 'Brian', last_name: 'Mock', location_pref: 'none', register: 'none', years: 0, email: 'mock@nopical.com', password: 'Chicago32', access: 'admin')
User.create(first_name: 'Stephanie', last_name: 'Arias', location_pref: 'none', register: 'none', years: 0, email: 'sarias@incschools.org', password: 'Chicago32', access: 'admin')