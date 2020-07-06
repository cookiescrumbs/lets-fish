FactoryGirl.define do
  factory :fishery do
    name { Array(1..3).map { Faker::Lorem.word }.join(' ') }
    description { Faker::Lorem.paragraph(4) }
    permission_tickets { Faker::Lorem.paragraph }
    slug { nil&.(name.parameterize) }
    address { create(:address) }
    contact_details { create(:contact_details) }
    published { true }

    factory :fishery_with_waters do

      transient do
        water_count 5
      end

      after(:create) do |fishery, evaluator|

        ['brown trout', 'rainbow trout', 'grayling', 'sea trout'].map do |name|
          FactoryGirl.create :species, name: name
        end

        %w(lake river).map do |category|
          FactoryGirl.create :water_type, category: category
        end

        FactoryGirl.create_list(
          :water,
          evaluator.water_count,
          fishery: fishery,
          latitude: 53.4807593,
          longitude: -2.2426305000000184,
          species: [Species.last],
          water_type_id: WaterType.first.id
        )
      end
    end
  end
end
