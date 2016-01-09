describe GooglePlace, type: :model do

  describe "returns a street", focus: true do

    before do
      place_id = "1234-ABCDE"
      stub_google_place_details place_id
      @google_place = GooglePlace.new place_id
    end

    it "is not valid without a name" do
      expect(true).to eql false
    end

  end

end
