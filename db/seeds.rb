require "faker"

20.times do
  College.create(name: Faker::University.name)
end

20.times do
  Course.create(name: Faker::Book.publisher)
end

50.times do
  Mono.create(title: Faker::Book.title, year: rand(2011..2019),
              author: Faker::Book.author, abstract: Faker::Quote.famous_last_words,
              college_id: rand(1..20), course_id: rand(1..20))
end
