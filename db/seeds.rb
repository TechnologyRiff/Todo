# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'



# Create a member
member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
member.skip_confirmation!
member.save!

puts "Seed finished"