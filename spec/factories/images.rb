# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :image do
    image_file_name { 'loch.jpg' }
    image_content_type { 'image/jpeg' }
    image_file_size { 1_973_208 }
    # geograph_photo_id { 123_456 }
  end
end
