FactoryGirl.define do
  factory :water do
    name Faker::Company.name
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    fishery
  end
end
