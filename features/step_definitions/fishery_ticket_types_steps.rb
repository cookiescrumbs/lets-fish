When(/^I create a ticket type$/) do |ticket_details|
  @ticket = Ticket.create! ticket_details.hashes
end

Then(/^I should see the following ticket type details$/) do |ticket_details|
  ticket_details_hash = ticket_details.hashes
    ticket_details_hash[0].each do | item |
      @ticket[0].instance_eval("#{item[0]}").should eql item[1]
  end
end