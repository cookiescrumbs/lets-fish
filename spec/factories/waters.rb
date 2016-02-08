# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
    binding.pry
  factory :water do
    name { Array(1..3).map{ Faker::Lorem.word }.join( ' ') }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    description { Faker::Lorem.paragraph }
    season_start "2014-10-20"
    season_end "2014-10-20"
    water_type_id 2
    species_ids [4]
    slug { name }
    images { fixture_file_upload 'spec/fixtures/files/loch.jpg', 'image/png' }
    fishery
  end
end
