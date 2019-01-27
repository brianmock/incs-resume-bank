# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'Brian', last_name: 'Mock', location_pref: 'none', register: 'none', years: 0, email: 'mock@nopical.com', password: 'Chicago32', access: 'admin')
User.create(first_name: 'Stephanie', last_name: 'Arias', location_pref: 'none', register: 'none', years: 0, email: 'sarias@incschools.org', password: 'Chicago32', access: 'admin')
