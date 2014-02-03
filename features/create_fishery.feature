Feature: Create Fishery

  In order for fisherman to find a fishery
  As a fishery
  I want to add my fishery to the fishing log

Scenario: Add fishery
  Given I have the following fishery details
  | name               | street    | line2     | city      | region     | postcode |  
  | Stocks Fly fishery | Catlow Rd | Slaidburn | Clitheroe | Lancashire | BB7 3AQ  | 
  When I create the fishery 
  Then "Stocks Fly fishery" should be in the list of fisheries
  
  
  

  
