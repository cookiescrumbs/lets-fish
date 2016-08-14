FactoryGirl.define do
  factory :user do
   	fisheries { create_list(:fishery, 1) }
  end
end
