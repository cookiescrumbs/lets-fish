FactoryGirl.define do
  factory :fishery do
    name "Cookies Fishery"
    street "7 Brown Trout Street"
    line2 "Address Line 2"
    city "Trout City"
    region "Trout Region"
    telephone "123456789"
    postcode "TR0 UT"
  end

  factory :report do
    todays_fishing "Was ok"
    prospects "Going to get better"
  end

end
