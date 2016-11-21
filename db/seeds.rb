# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Pitch.delete_all
Vote.delete_all
Round.delete_all
Cohort.delete_all

student_names = ["Greg", "Catherine", "Nan", "Zack", "Scott", "Jacob", "Marissa", "Matt", "Lindsay", "Michael", "Jason", "Miles"]
admin_names = ["Iulia", "Dan"]

cohort_name = ["nyc-2016-coyotes", "nyc-admins"]

cohort_name.each do |name|
  Cohort.create!(name: name)
end

instructors = admin_names.map do |admin_name|
  User.create!(name: admin_name, username: Faker::Internet.user_name, email: Faker::Internet.free_email, password: "password", admin: true, cohort_id: 2)
end

students = student_names.map do |student_name|
  User.create!(name: student_name, username: Faker::Internet.user_name, email: Faker::Internet.free_email, password: "password", cohort_id: 1)
end

round_one = Round.create!(name: "first", can_vote: true)

30.times do
  Pitch.create!(working_title: Faker::App.name, description: Faker::Hacker.say_something_smart, user_id: (3..14).to_a.sample, round_id: 1)
end

round_one_votes = students.map do |student|
  7.times do
    Vote.create!(user_id: student.id, pitch_id: (1..30).to_a.sample, round_id: 1)
  end
end
