FactoryGirl.define do
  factory :water_type do
    category { Faker::Name.first_name }
  end
end
