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
        lat_lng Faker::Address.latitude + ',' + Faker::Address.longitude
        description Faker::Lorem.sentence
        prices Faker::Commerce.price
        record Faker::Lorem.sentence
        season Faker::Lorem.sentence
        facilities Faker::Lorem.sentence
    end
end