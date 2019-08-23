require "faker"

r = Random.new

20.times do
  College.create(name: Faker::University.name)
end

20.times do
  Course.create(name: Faker::Book.publisher)
end

20.times do
  Requisition.create(url: Faker::Internet.url)
end

User.create({ email: "dyotamo@gmail.com",
              password: "passwd",
              password_confirmation: "passwd" })

1000.times do
  Mono.create!({ title: Faker::Book.title,
               author: Faker::Book.author,
               year: r.rand(2000..Time.now.year),
               abstract: Faker::Lorem.paragraph,
               url: Faker::Internet.url,
               course_id: r.rand(1..20),
               college_id: r.rand(1..20),
               user_id: User.first.id })
end
