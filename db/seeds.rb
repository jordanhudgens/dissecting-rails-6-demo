10.times do
  Topic.create!(
    title: Faker::ProgrammingLanguage.unique.name
  )
end

puts "10 Topics created"

50.times do
  User.create!(
    email: Faker::Internet.unique.email,
    username: Faker::App.unique.name.downcase.gsub(" ", ""),
    password: "asdfasdf",
    password_confirmation: "asdfasdf"
  )
end

puts "50 Users created"

100.times do
  Guide.create!(
    title: Faker::ChuckNorris.fact,
    content: Faker::Books::Lovecraft.paragraphs,
    topic: Topic.all.sample,
    user: User.all.sample
  )
end

puts "100 guides created"

admin = User.create!(
  email: "jordan@devcamp.com",
  username: "jordan",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  role: "admin"
)

puts "Admin user created"

10.times do
  Guide.create!(
    title: Faker::ChuckNorris.fact,
    content: Faker::Books::Lovecraft.paragraphs,
    topic: Topic.all.sample,
    user: admin
  )
end

puts "Guides created for admin"

User.all.each do |user|
  Following.create!(
    follower_id: user.id,
    followed_id: admin.id
  )
end

puts "Followings created for admin"
