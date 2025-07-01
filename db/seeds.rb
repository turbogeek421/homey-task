# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Adding initial project..."
project = Project.find_or_create_by(title: "My first project!")

puts "Adding admin project..."
user = User.find_or_create_by(name: "Admin")

puts "Adding a comment to the project..."
comment = Comment.create!(content: "Nam varius mauris turpis ut semper diam semper ut. Pellentesque urna felis pellentesque tristique condimentum a porta et eros. Proin sed odio accumsan facilisis dolor eget viverra leo.")
Activity.create!(project: project, user: user, record: comment)

puts "Adding a status change to the project..."
status_change = StatusChange.create!(from_status: "new", to_status: "pending")
Activity.create!(project: project, user: user, record: status_change)
