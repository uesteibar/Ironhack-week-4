# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

20.times do |num|
  Contact.create(name: "Contact #{num}", address: "Somewhere #{num}", phone: "678987678", email: "name@domain.com")
end
