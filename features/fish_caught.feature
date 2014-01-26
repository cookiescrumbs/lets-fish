Feature: Record the fish caught
  
  In order to keep a record of what has been caught
  As a fishery
  I want to be able to record details about fish caught

  Scenario: Record the details of fish caught
    When I create a record of the fish that has been caught 
    | species     | weight  |
    | Brown trout | 680.389 |
    Then I should see the following details of the fish that has been caught
    | species     | weight  |
    | Brown trout | 680.389 |

