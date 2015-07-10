require "rails_helper"

describe CitiesController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/cities"}).to route_to("cities#index")
    end

    it "should route to #create" do
      params = {
        post: "/cities",
        name: "barcelona"
      }
      expect(params).to route_to("cities#create")
    end

    it "should route to #create" do
      city = City.create(name: "Barcelona")
      params = {
        delete: "/cities/#{city.id}",
      }
      expect(params).to route_to("cities#destroy", id: city.id.to_s)
    end
  end
end
