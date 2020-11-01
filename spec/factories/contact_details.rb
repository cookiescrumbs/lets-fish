FactoryBot.define do
  factory :contact_details do
    name {Faker::Name.name}
    telephone    {Faker::PhoneNumber.phone_number}
    mobile       {Faker::PhoneNumber.cell_phone}
    email        {Faker::Internet.email}
    website      {Faker::Internet.url}
  end
end
