Feature: Fisherman details

  In order to record the details of a fisherman
  As a fishery
  I want to be able to store the details of a fisherman

Scenario: Record a fishermans details
  When I create a fisherman
  | Name         | email                     |  
  | Steven  Cook | stevenjamescook@gmail.com |  
  Then I should see the following fishermans details
  | Name         | email                     |  
  | Steven  Cook | stevenjamescook@gmail.com |  
