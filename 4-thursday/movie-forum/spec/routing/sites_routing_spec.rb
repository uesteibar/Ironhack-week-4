require "rails_helper"

describe SitesController do
  describe "routing" do
    it "should route to #index" do
      expect({:get => "/"}).to route_to("sites#index")
    end
  end
end
