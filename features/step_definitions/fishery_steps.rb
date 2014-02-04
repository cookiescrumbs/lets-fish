Given(/^I visit the fishery creation page$/) do
 visit '/fisheries/new'
end

When(/^I create Stocks Fly fishery$/) do |fishery_details|
  form_fields = fishery_details.hashes.first

  within('#new_fishery') do
    fill_in 'fishery_name', with: form_fields['name']
    fill_in 'fishery_street', with: form_fields['street']
    fill_in 'fishery_line2', with: form_fields['line2']
    fill_in 'fishery_city', with: form_fields['city']
    fill_in 'fishery_region', with: form_fields['region']
    fill_in 'fishery_postcode', with: form_fields['postcode']
  end

  click_on 'Create Fishery'
end

Then(/^"(.*?)" should be in the list of fisheries$/) do |fishery|
  visit '/fisheries/'
  page.should have_content(fishery)
end