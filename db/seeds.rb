require 'faker'
 
User.destroy_all
List.destroy_all
Task.destroy_all
i = 0
 5.times do
  i += 1
  user = User.new(
    name:     Faker::Name.name,
    email:    "user#{i}@example.com",
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


 10.times do
   List.create!(
     user: users.sample,
     title:  Faker::Lorem.sentence,
     description:   Faker::Lorem.paragraph
   )
 end
 lists = List.all
 i = 0
 100.times do
  i += 1
   Task.create!(
     list: lists.sample,
     body: Faker::Lorem.paragraph,
     title: "Task #{i}" 
   )
 end

 User.first.update_attributes!(
  email: 'priceat@gmail.com',
  password: 'helloworld'
  )

 admin = User.new(
  name: 'admin',
  email: 'admin@example.com',
  password: 'helloworld'
 )
 admin.skip_confirmation!
 puts "Admin User Created" if admin.save
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{List.count} lists created"
 puts "#{Task.count} tasks created"