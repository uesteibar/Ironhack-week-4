require "rails_helper"

describe MoviesController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/movies"}).to route_to("movies#index")
    end
  end
end
