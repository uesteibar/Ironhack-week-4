
5.times do |i|
  User.create(name: "User #{i}", email: "user#{i}@example.com")
end
