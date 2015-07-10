require "rails_helper"

describe ConcertsController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/concerts"}).to route_to("concerts#index")
    end
  end
end
