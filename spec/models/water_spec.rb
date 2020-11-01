describe Water, type: :model do
  before do
    stub_google_geocode_lat_lng
    stub_google_geocode_address
    @species    = FactoryBot.create_list :species, 5
    @water_type = FactoryBot.create_list :water_type, 5

    @water = FactoryBot.create(
      :water,
      address: nil,
      latitude: -41.21924848834151,
      longitude: -70.70650221597815,
      species: [ Species.last ],
      water_type_id: WaterType.first.id
    )
    @water_with_address = FactoryBot.create(
      :water,
      address: 'Somewhere, Wales',
      latitude: -41.21924848834151,
      longitude: -70.70650221597815,
      species: [ Species.last ],
      water_type_id: WaterType.first.id
    )
  end

  it 'has a contributor' do
    @water.name = 'scoat tarn'
    expect(@water.contributor).to include(
        photo: 'jerry-slater', 
        name: 'Jerry Slater',
        bio: 'Jerry loves his wild places and he started fishing for trout as a boy, in the streams of mid Wales, and the hill lochs on the west coast of Scotland. These days he tends to be knee deep in small Pennine rivers, or fishing the Llyns and tarns of North Wales and the Lake District. The experience is more important than the size of the fish, and wild is beautiful.'

    )
  end

  it "doesn't have a contributor" do
    @water.name = 'Sybil Tarn'
    expect(@water.contributor).to eql nil
  end

  it 'is not valid without a name' do
    @water.name = nil
    expect(@water).not_to be_valid
  end

  it 'is not valid without a fishery id' do
    @water.fishery_id = nil
    expect(@water).not_to be_valid
  end

  it 'is not valid without a species' do
    @water.species = []
    expect(@water).not_to be_valid
  end

  it 'is not valid without a water type' do
    @water.water_type_id = nil
    expect(@water).not_to be_valid
  end

  describe 'location' do
    it 'validates the longitude and latitude' do
      @water.longitude = -100_000
      @water.latitude = 100_000
      expect(@water).not_to be_valid
    end
  end

  describe 'seasons' do
    it 'changes the seasons year to 2012 (a leap year)' do
      @water.season_start = Date.new(2002).to_s
      expect(@water.season_start).to eql Date.new(2012)

      @water.season_end = Date.new(2002).to_s
      expect(@water.season_end).to eql Date.new(2012)
    end
  end

  describe 'Address' do
    context 'water without an address' do
      it "is the 'formatted address' from google maps goecode api" do
        expect(@water.address).to eql 'Manchester, UK'
      end
    end

    context 'water with an address' do
      it 'uses the address given' do
        expect(@water_with_address.address).to eql 'Somewhere, Wales'
      end
    end
  end

  describe 'short address' do
    it 'handles an address with no elements' do
      @water.address = ''
      expect(@water.short_address).to eql nil
    end

    it 'handles a nil address' do
      @water.address = nil
      expect(@water.short_address).to eql nil
    end

    it 'returns the first two items of the formatted address' do
      @water.address = 'Somewhere, Northumberland, UK'
      expect(@water.short_address).to eql 'Somewhere, Northumberland'
    end
  end

  describe 'images without the hero image' do

    it 'return all the images minus the hero image' do
      @water.images = [
        FactoryBot.create(:image, hero: true),
        FactoryBot.create(:image, hero: false),
        FactoryBot.create(:image, hero: false)
     ]
        expect(@water.images_without_hero.length).to eql 2
        expect(@water.images_without_hero.first.hero).to eql false
        expect(@water.images_without_hero.last.hero).to eql false
    end
  end

  describe 'hero image' do

    it 'returns the hero image' do
      @water.images = [
        FactoryBot.create(:image, hero: true, image_file_name: 'i-could-be-your-hero-baby.jpg'),
        FactoryBot.create(:image, hero: false),
        FactoryBot.create(:image, hero: false)
     ]
      expect(@water.hero_image.image_file_name).to eql 'i-could-be-your-hero-baby.jpg'
    end
  end

  describe 'permission & tickets' do
    context 'water has permission and tickets details' do
      it 'return the permission info for the water' do
        @water.permission_tickets = 'You can get a ticket form the boat house'
        @water.save
        expect(@water.negotiated_permission_tickets).to eql 'You can get a ticket form the boat house'
      end
    end

    context 'fishery has permission and ticket details but water has none' do
      it 'return the permission info from the fishery' do
        @water.permission_tickets = ''
        @water.fishery.permission_tickets = 'You can get a ticket to fish all the lochs'
        @water.save
        expect(@water.negotiated_permission_tickets).to eql 'You can get a ticket to fish all the lochs'
      end
    end

    context 'both fishery and water has no permission and ticket details' do
      it 'return nil' do
       @water.fishery.permission_tickets = ''
       @water.permission_tickets = ''
       @water.save
       expect(@water.negotiated_permission_tickets).to eql ''
      end
    end
  end
end
