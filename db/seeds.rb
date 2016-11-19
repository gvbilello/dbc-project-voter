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

round_one = Round.create!(name: "first")

3.times do
  Pitch.create!(working_title: Faker::App.name, description: Faker::Hacker.say_something_smart, user_id: (4..6).to_a.sample, round_id: 1)
end

27.times do
  Pitch.create!(working_title: Faker::App.name, description: Faker::Hacker.say_something_smart, user_id: (3..14).to_a.sample, round_id: 1)
end

round_one_votes = students.map do |student|
  5.times do
    Vote.create!(user_id: student.id, pitch_id: (1..30).to_a.sample, round_id: 1)
  end
  2.times do
    Vote.create!(user_id: student.id, pitch_id: (1..3).to_a.sample, round_id: 1)
  end
end
