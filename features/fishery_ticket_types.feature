Feature: Fishery ticket types

  In order to choose a type of fishing ticket
  As a fisherman
  I want to be able to choose the type of ticket I require for my fishing trip

  Scenario: Ticket types
    When I create a ticket type
    | ticket_type |  
    | half day    |  
    Then I should see the following ticket type details
    | ticket_type |  
    | half day    |  
