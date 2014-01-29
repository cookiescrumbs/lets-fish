Feature: Fishery details and locations

  In order to find a place to go fishing
  As a fisherman
  I want to see a fisheries details and location

Scenario: Fishery details and location
  When I create a fishery with the following details
  | name               | street    | line2     | city      | region     | postcode |  
  | Stocks Fly fishery | Catlow Rd | Slaidburn | Clitheroe | Lancashire | BB7 3AQ  |  
  Then I should see the following fishery details
  | name               | street    | line2     | city      | region     | postcode |  
  | Stocks Fly fishery | Catlow Rd | Slaidburn | Clitheroe | Lancashire | BB7 3AQ  |  
