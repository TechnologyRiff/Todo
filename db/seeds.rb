# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

 # Create Users
5.times do
  user = User.new(
    name:       Faker::Name.name,
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

 #create list
 5.times do
   list = List.create!(
    user: users.sample,
    title:  Faker::Lorem.sentence,
    description:   Faker::Lorem.paragraph
   )
   list.update_attributes!(created_at: rand(10.minutes .. 1.year).ago)
 end

 lists = List.all
 
 # Create items
 50.times do
   item = Item.create!(
    list: lists.sample,
    name: Faker::Lorem.sentence
   )
   item.update_attributes!(created_at: rand(10.minutes .. 2.weeks).ago)
 end

 items = Item.all
 
 puts "#{User.count} users created"
 puts "#{List.count} lists created"
 puts "#{Item.count} tasks created"



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