require "rails_helper"

RSpec.describe InsectsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/insects").to route_to("insects#index")
    end

    it "routes to #new" do
      expect(:get => "/insects/new").to route_to("insects#new")
    end

    it "routes to #show" do
      expect(:get => "/insects/1").to route_to("insects#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/insects/1/edit").to route_to("insects#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/insects").to route_to("insects#create")
    end

    it "routes to #update" do
      expect(:put => "/insects/1").to route_to("insects#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/insects/1").to route_to("insects#destroy", :id => "1")
    end

  end
end
