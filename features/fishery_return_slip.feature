Feature: Fishery return slip

  In order to keep a record of fish caught
  As a fishery
  I want to create a return slip with details of a fishermans success

  Scenario: Creating a return slip
    When I create a return slip
    | description                                                               |
    | Fishing a small tied cats booby. Had one on a fast glass and one on a DI7 |
    Then I should see the following return slip details
    | description                                                               |
    | Fishing a small tied cats booby. Had one on a fast glass and one on a DI7 |
