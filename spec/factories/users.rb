FactoryGirl.define do
  factory :user do
   	fisheries { create_list(:fishery_with_waters, 1) }
  end
end
