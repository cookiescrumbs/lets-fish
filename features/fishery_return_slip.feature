Feature: Fishery return slip

  In order to keep a record of fish caught
  As a fishery
  I want to record a return slip with details of that fishermans success

  Scenario: Create a return slip
    When I create a return slip
    | description                                                               |
    | Fishing a small tied cats booby. Had one on a fast glass and one on a DI7 |
    Then I should see the following return slip details
    | description                                                               |
    | Fishing a small tied cats booby. Had one on a fast glass and one on a DI7 |
  
    # fishery has many reports 
    #   report belongs to a fishery (fishery:references), has many returns
    #   return belongs to a report (report:references), belongs to fisherman (fisherman:reference), belongs to ticket_type (ticket_type:reference), has many fishs
    #     fisherman has many returns
    #     ticket_type has many returns
    #     fish belongs to a return (return:references)

