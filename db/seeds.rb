require 'faker'

20.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: "password")
end

40.times do
  Post.create(title: Faker::Lorem.sentence, text: Faker::Lorem.sentence, user_id: rand(1..20))
end

120.times do
  Comment.create(text: Faker::Lorem.sentence, post_id: rand(1..40),user_id: rand(1..20) )
end
