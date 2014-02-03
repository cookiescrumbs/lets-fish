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

When(/^I create a fisherman$/) do |fisherman_details|
  @fisherman = Fisherman.create! fisherman_details.hashes
end

Then(/^I should see the following fishermans details$/) do |fisherman_details|
   fisherman_hash = fisherman_details.hashes
    fisherman_hash[0].each do | item |
      @fisherman[0].instance_eval("#{item[0]}").should eql item[1]
  end
end

When(/^I create a fishery with the following details$/) do |fishery_details|
  @fishery = Fishery.create! fishery_details.hashes
end

Then(/^I should see the following fishery details$/) do |fishery_details|
  fishery_details_hash = fishery_details.hashes
   fishery_details_hash[0].each do | item |
     @fishery[0].instance_eval("#{item[0]}").should eql item[1]
   end
end

When(/^I create a report$/) do |report_details|
  @report = Report.create! report_details.hashes
end

Then(/^I should see the following report details$/) do |report_details|
  report_details_hash = report_details.hashes
    report_details_hash[0].each do | item |
      @report[0].instance_eval("#{item[0]}").should eql item[1]
  end
end

When(/^I create a return slip$/) do |return_slip_details|
  @return_slip = Return.create! return_slip_details.hashes
end

Then(/^I should see the following return slip details$/) do |return_slip_details|
  return_slip_details_hash = return_slip_details.hashes
    return_slip_details_hash[0].each do | item |
      @return_slip[0].instance_eval("#{item[0]}").should eql item[1]
  end
end

When(/^I create a ticket type$/) do |ticket_details|
  @ticket = Ticket.create! ticket_details.hashes
end

Then(/^I should see the following ticket type details$/) do |ticket_details|
  ticket_details_hash = ticket_details.hashes
    ticket_details_hash[0].each do | item |
      @ticket[0].instance_eval("#{item[0]}").should eql item[1]
  end
end