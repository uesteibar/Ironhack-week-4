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
  Project.create! name: '#{num} project', description: "#{num} project description"
end
