require "rails_helper"

describe ConcertsController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/concerts"}).to route_to("concerts#index")
    end

    it "should route to #show" do
      concert = Concert.create(
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city: 'Barcelona',
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      )
      expect({:get => "/concerts/#{concert.id}"}).to route_to("concerts#show", id: concert.id.to_s)
    end

    it "should route to #new" do
      expect({:get => "/concerts/new"}).to route_to("concerts#new")
    end

    it "should route to #create" do
      params = {
        post: "/concerts",
        band: 'Jessie J',
        venue: 'Parque Pedralbes',
        city: 'Barcelona',
        price: 20,
        date: 1.week.from_now,
        description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
      }
      expect(params).to route_to("concerts#create")
    end
  end
end