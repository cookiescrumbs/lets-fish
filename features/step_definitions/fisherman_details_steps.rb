When(/^I create a fisherman$/) do |fisherman_details|
  @fisherman = Fisherman.create! fisherman_details.hashes
end

Then(/^I should see the following fishermans details$/) do |fisherman_details|
   fisherman_hash = fisherman_details.hashes
    fisherman_hash[0].each do | item |
      @fisherman[0].instance_eval("#{item[0]}").should eql item[1]
  end
end