require "rails_helper"

describe MoviesController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/movies"}).to route_to("movies#index")
    end

    it "should route to #create" do
      expect({:post => "/movies"}).to route_to("movies#create")
    end
  end
end
