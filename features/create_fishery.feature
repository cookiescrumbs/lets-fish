Feature: Create Fishery

  In order for fisherman to find a fishery
  As a fishery
  I want to add my fishery to the fishing log

Scenario: Can add a fishery
  Given I visit the fishery creation page
  When I create a fishery
  | name               | street    | line2     | city      | region     | postcode |  
  | Stocks Fly fishery | Catlow Rd | Slaidburn | Clitheroe | Lancashire | BB7 3AQ  | 
  Then "Stocks Fly fishery" should be in the list of fisheries

Scenario: Validation of fishery details
  Given I visit the fishery creation page
  When I create a fishery
  | name | street | line2 | city | region | postcode |  
  |      |        |       |      |        |          |  
  Then I should see the message "Name can't be blank"
  Then I should see the message "Street can't be blank"
  Then I should see the message "City can't be blank"
  Then I should see the message "Region can't be blank"