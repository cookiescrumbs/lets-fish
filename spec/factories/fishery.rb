FactoryGirl.define do
  factory :fishery do
    name Faker::Company.name
    contact_name Faker::Name.name
    street Faker::Address.street_address
    line2 Faker::Address.street_address
    country Faker::Address.country
    region Faker::Address.state
    telephone Faker::PhoneNumber.phone_number
    mobile Faker::PhoneNumber.cell_phone
    postcode Faker::Address.postcode
    email Faker::Internet.email
    website Faker::Internet.url
  end
end