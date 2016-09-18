# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :water do
    name { Array(1..3).map { Faker::Lorem.word }.join(' ') }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    description { Faker::Lorem.paragraph }
    season_start '2014-10-20'
    season_end '2014-10-20'
    images { create_list(:image, 2) }
    fishery
    species { create_list(:species, 1) }
    water_type_id { 1 }
  end
end
