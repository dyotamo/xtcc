require "csv"

CSV.foreach(File.join(Rails.root, "db", "fixture", "colleges.csv"), headers: true) do |college|
  College.create!(name: college["name"])
end

CSV.foreach(File.join(Rails.root, "db", "fixture", "courses.csv"), headers: true) do |course|
  Course.create!(name: course["name"])
end

CSV.foreach(File.join(Rails.root, "db", "fixture", "monos.csv"), headers: true, col_sep: "|") do |mono|
  Mono.create!({title: mono["title"].titleize, 
                year: mono["year"], 
                author: mono["author"], 
                abstract: mono["abstract"], 
                url: mono["url"], 
                college: College.find(College.pluck(:id).sample),
                course: Course.find(Course.pluck(:id).sample)})
end

User.create!({ email: "dyotamo@gmail.com", password: "passwd", password_confirmation: "passwd" })
