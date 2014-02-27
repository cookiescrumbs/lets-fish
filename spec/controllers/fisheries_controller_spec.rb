require 'spec_helper'

describe FisheriesController do

  # This should return the minimal set of attributes required to create a valid
  # Fishery. As you add validations to Fishery, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do 
    {
      name: 'Stockies', 
      street: 'Fish Street',
      line2: 'Fish town', 
      city: 'Fish city', 
      region: 'Fish region', 
      postcode:'Fish Postcode'
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FisheriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all fisheries as @fisheries" do
      fishery = Fishery.create! valid_attributes
      get :index, {}, valid_session
      assigns(:fisheries).should eq([fishery])
    end
  end

  describe "GET show" do
    it "assigns the requested fishery as @fishery" do
      fishery = Fishery.create! valid_attributes
      get :show, {:id => fishery.to_param}, valid_session
      assigns(:fishery).should eq(fishery)
    end
  end

  describe "GET new" do
    it "assigns a new fishery as @fishery" do
      get :new, {}, valid_session
      assigns(:fishery).should be_a_new(Fishery)
    end
  end

  describe "GET edit" do
    it "assigns the requested fishery as @fishery" do
      fishery = Fishery.create! valid_attributes
      get :edit, {:id => fishery.to_param}, valid_session
      assigns(:fishery).should eq(fishery)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Fishery" do
        expect {
          post :create, {:fishery => valid_attributes}, valid_session
        }.to change(Fishery, :count).by(1)
      end

      it "assigns a newly created fishery as @fishery" do
        post :create, {:fishery => valid_attributes}, valid_session
        assigns(:fishery).should be_a(Fishery)
        assigns(:fishery).should be_persisted
      end

      it "redirects to the created fishery" do
        post :create, {:fishery => valid_attributes}, valid_session
        response.should redirect_to(Fishery.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fishery as @fishery" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fishery.any_instance.stub(:save).and_return(false)
        post :create, {:fishery => valid_attributes}, valid_session
        assigns(:fishery).should be_a_new(Fishery)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Fishery.any_instance.stub(:save).and_return(false)
        post :create, {:fishery => valid_attributes}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested fishery" do
        fishery = Fishery.create! valid_attributes
        Fishery.any_instance.should_receive(:update).with({'name' => 'has changed'})
        put :update, { id: fishery.to_param, fishery: {'name' => 'has changed'}}, valid_session
      end

      it "assigns the requested fishery as @fishery" do
        fishery = Fishery.create! valid_attributes
        put :update, {:id => fishery.to_param, :fishery => valid_attributes}, valid_session
        assigns(:fishery).should eq(fishery)
      end

      it "redirects to the fishery" do
        fishery = Fishery.create! valid_attributes
        put :update, {:id => fishery.to_param, :fishery => valid_attributes}, valid_session
        response.should redirect_to(fishery)
      end
    end

    describe "with invalid params" do
      it "assigns the fishery as @fishery" do
        fishery = Fishery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Fishery.any_instance.stub(:save).and_return(false)
        put :update, {:id => fishery.to_param, :fishery => valid_attributes}, valid_session
        assigns(:fishery).should eq(fishery)
      end

      it "re-renders the 'edit' template" do
        fishery = Fishery.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Fishery.any_instance.stub(:save).and_return(false)
        put :update, {:id => fishery.to_param, :fishery => valid_attributes}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested fishery" do
      fishery = Fishery.create! valid_attributes
      expect {
        delete :destroy, {:id => fishery.to_param}, valid_session
      }.to change(Fishery, :count).by(-1)
    end

    it "redirects to the fisheries list" do
      fishery = Fishery.create! valid_attributes
      delete :destroy, {:id => fishery.to_param}, valid_session
      response.should redirect_to(fisheries_url)
    end
  end

end
