require 'geograph_service'

describe GeographService, ".user_attribution_from" do

  before(:each)do
    stub_geograph_photo_details
  end

  it "returns a hash containing details of a user's attribution from a photo id" do
    user_attribution = GeographService::user_attribution_from(photo_id: "158570")
    expect(user_attribution).to eql(
        {
          name:"Theo Pike",
          profile_url:"http://www.geograph.org.uk//profile/123456",
          licence:"http://creativecommons.org/licenses/by-sa/2.0/"
        }
      )
  end
end
