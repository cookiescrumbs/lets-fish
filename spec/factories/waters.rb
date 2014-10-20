# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :water do
    name Faker::Lorem.word
    latitude Faker::Address.latitude
    longitude Faker::Address.longitude
    description Faker::Lorem.paragraph
    prices Faker::Commerce.price
    season_start "2014-10-20"
    season_end "2014-10-20"
  end
end
