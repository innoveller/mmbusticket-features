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

Scenario Outline: Attempt search with missing required field
    Given John has selected all required fields except for "<Field>"
    When John clicks the search button
    Then John should see a warning message indicating that "<Field>" is required
  Examples:
    | Field                |
    | Departure Location   |
    | Destination Location |
    | Departure Date       |
    | Nationality          |


Scenario: Search for express bus trips with identical departure and destination locations
    Given John has selected "Mandalay" as the departure location
    And John has selected "Mandalay" as the destination location
    And John has selected a valid departure date
    When John clicks the search button
    Then John should see a warning message indicating that the departure and destination locations cannot be the same

