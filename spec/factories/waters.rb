# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :water do

    name Faker::Lorem.word
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    description Faker::Lorem.paragraph
    season_start "2014-10-20"
    season_end "2014-10-20"
    water_type_id 4
    species_ids [4]
    fishery

  end
end
