# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "--- Deleting all Projects ---"
Project.destroy_all

puts "--- Creating 25 Projects ---"
25.times do |num|
  project = Project.create! name: "#{num} project", description: "#{num} project description"
  3.times do |entry_num|
    project.entries.create(hours: entry_num, minutes: 15, comments: "hey!", date: Date.today)
  end
end
Project.create! name: "25 project"
Project.create! name: "26 project", description: ""
