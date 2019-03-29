require "faker"

20.times do
  College.create(name: Faker::University.name)
end

20.times do
  Course.create(name: Faker::Book.publisher)
end

20.times do
  Requisition.create(url: Faker::Internet.url)
end
