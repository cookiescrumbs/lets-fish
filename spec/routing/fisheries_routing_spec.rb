require "spec_helper"

describe FisheriesController do
  describe "routing" do

    it "routes to #index" do
      get("/fisheries").should route_to("fisheries#index")
    end

    it "routes to #new" do
      get("/fisheries/new").should route_to("fisheries#new")
    end

    it "routes to #show" do
      get("/fisheries/1").should route_to("fisheries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fisheries/1/edit").should route_to("fisheries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fisheries").should route_to("fisheries#create")
    end

    it "routes to #update" do
      put("/fisheries/1").should route_to("fisheries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fisheries/1").should route_to("fisheries#destroy", :id => "1")
    end

  end
end
