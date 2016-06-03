FactoryGirl.define do
  factory :fishery do
    name { Array(1..3).map { Faker::Lorem.word }.join(' ') }
    slug { name }
    place_id Faker::Bitcoin.address
    address { create(:address) }
    contact_details { create(:contact_details) }
    factory :fishery_with_waters do
      after(:create) do |fishery, _evaluator|
        FactoryGirl.create_list(
          :water,
          5,
          fishery: fishery,
          latitude: 53.4807593,
          longitude: -2.2426305000000184,
          images: create_list(:image, 1)
        )
      end
    end
  end
end
