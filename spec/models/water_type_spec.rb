describe WaterType, type: :model do
  before(:each) do
    @water_type = FactoryBot.create :water_type
  end

  it 'is not valid without a category' do
    @water_type.category = nil
    expect(@water_type).not_to be_valid
  end

  it 'titilizes the category' do
    @water_type.category = 'reservoir'
    expect(@water_type.category).to eql 'reservoir'
  end
end
