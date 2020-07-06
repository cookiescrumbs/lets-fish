FactoryGirl.define do
  factory :address do
    postcode  Faker::Address.postcode
    street    Faker::Address.street_address
    line2     Faker::Address.street_address
    country   { 'Scotland' }
    region    Faker::Address.state
  end
end
