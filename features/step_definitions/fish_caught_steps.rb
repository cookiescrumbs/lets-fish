When(/^I create a record of the fish that has been caught$/) do |fish_caught|
  @fish = Fish.create! fish_caught.hashes
end

Then(/^I should see the following details of the fish that has been caught$/) do |fish_caught|
  fish_caught_hash = fish_caught.hashes
   fish_caught_hash[0].each do | item |
       value = (item[1].valid_float?)? item[1].to_f : item[1]
      @fish[0].instance_eval("#{item[0]}").should eql value
   end
end