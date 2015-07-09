require "rails_helper"

describe UsersController do
  describe "routing" do

    it "should route to #create" do
      expect({:post => "/users"}).to route_to("users#create")
    end

    it "should route to #authenticate" do
      expect({:post => "/users/login"}).to route_to("users#authenticate")
    end

    context "NO session cookie" do
      it "should route to #new" do
        expect({:get => "/users/new"}).to route_to("users#new")
      end

      it "should route to #login" do
        expect({:get => "/users/login"}).to route_to("users#login")
      end
    end
  end
end
