When(/^I create a fishery with the following details$/) do |fishery_details|
  @fishery = Fishery.create! fishery_details.hashes
end

Then(/^I should see the following fishery details$/) do |fishery_details|
  fishery_details_hash = fishery_details.hashes
   fishery_details_hash[0].each do | item |
     @fishery[0].instance_eval("#{item[0]}").should eql item[1]
   end
end