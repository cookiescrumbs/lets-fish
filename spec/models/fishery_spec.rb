describe Fishery, :type => :model do
  
  describe "validate fields" do
    
    before { @fishery = FactoryGirl.create(:fishery) }

    it "is not valid without a name" do
      @fishery.name = nil
      expect(@fishery).not_to be_valid
    end

  end

  before(:all) do
    @fishery = FactoryGirl.create(
        :fishery, 
        #contact details
        contact_name: 'Steven Cook', 
        telephone: '',
        mobile: '',
        email: 'stevenjamescook@gmail.com',
        website: 'www.stevencook.com',
        #location
        street: 'Jubilee Street',
        line2: 'Langworthy',
        region: 'Greater Manchester',
        country: 'England',
        postcode: 'M6 5EP'
      )
  end


  describe "#contact_details" do
    
    it "returns a hash of 'contact details' which aren't empty" do
      
      expect(@fishery.contact_details).to eql (
        { 
          'Contact name' => @fishery.contact_name,
          'Email'        => @fishery.email,
          'Website'      => @fishery.website
        }
      )

    end
  end

  describe "#location" do
    
    it "returns a hash of 'location details' which aren't empty" do

      expect(@fishery.location).to eql (
        {
          'Address' => 'Jubilee Street, Langworthy, Greater Manchester, England, M6 5EP'
        }
      )

    end

  end

  describe "#address" do

    it "returns the full fishery address concatenate into one string" do
      
      expect(@fishery.address).to eql ('Jubilee Street, Langworthy, Greater Manchester, England, M6 5EP')

    end

  end

  after(:all) { @fishery.destroy }

end