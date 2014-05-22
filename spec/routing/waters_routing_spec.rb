require "spec_helper"

describe WatersController do
  describe "routing" do

    it "routes to #index" do
      get("/waters").should route_to("waters#index")
    end

    it "routes to #new" do
      get("/waters/new").should route_to("waters#new")
    end

    it "routes to #show" do
      get("/waters/1").should route_to("waters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/waters/1/edit").should route_to("waters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/waters").should route_to("waters#create")
    end

    it "routes to #update" do
      put("/waters/1").should route_to("waters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/waters/1").should route_to("waters#destroy", :id => "1")
    end

  end
end
