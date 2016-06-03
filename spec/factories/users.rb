require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name  Faker::Name.name
    email Faker::Internet.email
    password 'password12345'
    password_digest { BCrypt::Password.create(password.to_s) }
  end
end
