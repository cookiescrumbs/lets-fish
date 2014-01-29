When(/^I create a report$/) do |report_details|
  @report = Report.create! report_details.hashes
end

Then(/^I should see the following report details$/) do |report_details|
  report_details_hash = report_details.hashes
    report_details_hash[0].each do | item |
      @report[0].instance_eval("#{item[0]}").should eql item[1]
  end
end
