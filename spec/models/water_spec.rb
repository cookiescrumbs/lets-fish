describe Water, :type => :model do
  
  let(:water) { FactoryGirl.create(:water) }

   it "is not valid without a name" do
      water.name = nil
      expect(water).not_to be_valid
    end
end
