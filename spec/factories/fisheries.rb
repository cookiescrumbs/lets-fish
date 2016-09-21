FactoryGirl.define do
  factory :fishery do
    name { Array(1..3).map { Faker::Lorem.word }.join(' ') }
    description { Faker::Lorem.paragraph(4) }
    slug { name }
    place_id Faker::Bitcoin.address
    address { create(:address) }
    contact_details { create(:contact_details) }
    factory :fishery_with_waters do

      after(:create) do |fishery, _evaluator|

      ['brown trout', 'rainbow trout', 'grayling', 'sea trout'].map do |name|
        FactoryGirl.create :species, name: name
      end

      %w(lake river).map do |category|
        FactoryGirl.create :water_type, category: category
      end

        FactoryGirl.create_list(
          :water,
          5,
          fishery: fishery,
          latitude: 53.4807593,
          longitude: -2.2426305000000184,
          images: create_list(:image, 1),
          species: [ Species.last ],
          water_type_id: WaterType.first.id
        )
      end
    end
  end
end
