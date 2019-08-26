require "csv"
require "faker"

CSV.foreach(File.join(Rails.root, "db", "fixture", "colleges.csv"), headers: true) do |college|
  College.create!(name: college["name"])
end

CSV.foreach(File.join(Rails.root, "db", "fixture", "courses.csv"), headers: true) do |course|
  Course.create!(name: course["name"])
end

User.create!({ email: "dyotamo@gmail.com",
               password: "passwd",
               password_confirmation: "passwd" })
