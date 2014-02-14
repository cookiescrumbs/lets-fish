Feature: Fishery report
  
  In order to keep a record and report on a days fishing overall
  As a fishery
  I want be able to create a report containing information about the days fishing

Scenario: Creating a report
  When I create a report 
  | todays_fishing                                                                    | prospects                                                                         |  
  | A lovely sunny winters day here today with steady conditions and a slight breeze. | Looks like we are going to get some warmer weather, so the fishing should improve |  
  Then I should see the following report details
  | todays_fishing                                                                    | prospects                                                                         |  
  | A lovely sunny winters day here today with steady conditions and a slight breeze. | Looks like we are going to get some warmer weather, so the fishing should improve |

