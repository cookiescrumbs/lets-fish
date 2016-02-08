# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :image do
    image_file_name { "loch.jpg" }
    image_content_type { "image/jpeg" }
    image_file_size { 1973208 }
  end
end
