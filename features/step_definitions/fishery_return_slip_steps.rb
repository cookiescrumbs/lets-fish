When(/^I create a return slip$/) do |return_slip_details|
  @return_slip = Return.create! return_slip_details.hashes
end

Then(/^I should see the following return slip details$/) do |return_slip_details|
  return_slip_details_hash = return_slip_details.hashes
    return_slip_details_hash[0].each do | item |
      @return_slip[0].instance_eval("#{item[0]}").should eql item[1]
  end
end