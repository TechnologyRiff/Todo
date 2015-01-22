# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

 member = User.new(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld'
)
member.skip_confirmation!
member.save!

#create list
list = List.create!(
  user: member,
  title:  Faker::Lorem.sentence,
  description:   Faker::Lorem.paragraph
)

# Create items
10.times do
  item = Item.create!(
    list: list,
    name: Faker::Lorem.sentence
  )
  item.update_attributes!(created_at: rand(10.minutes .. 2.weeks).ago)
end

puts "#{User.count} users created"
puts "#{List.count} lists created"
puts "#{Item.count} tasks created"
puts "Seed finished"
