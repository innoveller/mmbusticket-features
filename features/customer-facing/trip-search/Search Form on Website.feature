Feature: Search Form on Website

Search trips with criteria

Background:
  Given John is on the home page of MMBusTicket website

@website
Scenario: Default values on the search form fields
  Given John has not previously performed any searches on his device
  When the home page loads
  Then John should see the search form on the home page
  And the source, the destination, the departure date and the nationaly should all be empty
  And the Number of seats field should be preset to 1
  And the maximum number of selectable seats should be 4
  And the past dates should not be selectable
  And the dates two months from today should not be selectable

Scenario Outline: Attempt searching with missing required field
    Given John has selected all required fields except for "<Field>"
    When John clicks the search button
    Then John should see a warning message indicating that "<Field>" is required
  Examples:
    | Field                |
    | Departure Location   |
    | Destination Location |
    | Departure Date       |
    | Nationality          |


# Scenario: Search for express bus trips with identical departure and destination locations
#     Given John has selected "Mandalay" as the departure location
#     And John has selected "Mandalay" as the destination location
#     And John has selected a valid departure date
#     When John clicks the search button
#     Then John should see a warning message indicating that the departure and destination locations cannot be the same

Scenario: Search for express bus trips with identical source and destination locations
    Given John has selected "Mandalay" as the source location
    When he tries to choose "Mandalay" as the destination location
    Then "Mandalay" should be disabled and unselectable

    Given John has selected "Yangon" as the destination location
    When he tries to choose "Yangon" as the source location
    Then "Yangon" should be selectable for the source location
    But the previously selected destination location should be cleared


Scenario: Attempt searching with invalid keywords in source or destination location
    Given John has not previously performed any searches on his device
    When he enters invalid keywors in the source or destination location
    Then he should see the validation message indicating there is no result related with searched keywords


Scenario: Attempt searching with valid inputs
    Given John has filled all the required fields with valid inputs
    When he clicks "Search Now" button
    Then he should be successfully navigated to trip results page
    And the system should display the correct results depending on the search criteria
    And the system should display a message indicating no results available when no trips match with search criteria
    