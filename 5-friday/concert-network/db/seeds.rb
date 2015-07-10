
bands = [
  "Linkin Park",
  "Jessie J",
  "Ella Eyre",
  "Shlomo & the lip factory",
]

cities = [
  "Barcelona",
  "Donosti",
  "Bilbo"
]

venues = [
  "Carrer something",
  "Parque pedralbes",
  "Somewhere in the middle"
]

dates = [
  1.day.from_now,
  1.day.ago,
  1.month.from_now
]

2.times do
  bands.each do |band|
    Concert.create(
    band: band,
    city: cities.sample,
    venue: venues.sample,
    date: dates.sample,
    price: Random.rand(10...100),
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
  end
end
