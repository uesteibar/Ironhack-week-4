
5.times do |i|
  user = User.create(name: "User #{i}", email: "user#{i}@example.com")
  3.times do |j|
    user.products.create(
    title: "Awesome Product #{j}",
    description: "It is awesome!",
    deadline: 1.day.from_now,
    minimum_bid: 5)
  end
end
