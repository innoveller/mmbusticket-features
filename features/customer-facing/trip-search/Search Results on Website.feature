Feature: Search Results on Website

Background:
  Given John is on the mmbusticket website
  And John filled in search form with valid inputs


Scenario: Showing primary and secondary info in trip results
    Given John has made a search
    When bus trip results are displayed
    Then each result must prominently display:
      | Primary Info      |
      | departure time    |
      | bus type          |
      | operator name     |
      | unit ticket price |
    And each result must contain:
      | Secondary Info            |
      | total ticket price        |
      | detailed route with intermediate stops |
      | estimated arrival date    |


Scenario Outline: Showing Time period label for trip results
  Given John has search 
  And the results are on display  
  When John check the time period for each trip result  
  Then The trip result at <Departure Time> should be labelled as <Time Period Bus>

Examples:
  | Departure Time | Time Period Bus |
  | 02:01 AM       | Day Bus         |
  | 08:00 AM       | Day Bus         |
  | 12:00 PM       | Day Bus         |
  | 12:01 PM       | Afternoon Bus   |
  | 04:00 PM       | Afternoon Bus   |
  | 04:01 PM       | Night Bus       |
  | 08:00 PM       | Night Bus       |
  | 12:00 AM       | Night Bus       |
  | 02:00 AM       | Night Bus       |


Scenario: Trip result with no seat available
  When John click the search button
  Then John should not see the trip where all of the seats are unavailable


Scenario: Fully booked on a particular date
  Given John have selected a departure date where all trips are fully booked
  When John click the search button
  Then John should see a message indicating that there are no trips available for the selected date


Scenario: No trip exists on a particular date
  Given John have selected a departure date where there is no trip available
  When John click the search button
  Then John should see a message indicating that there are no trips available for the selected date


# This scenario shows that depending on operators and routes, local and foreigner prices may or may not differ
Scenario Outline: Different ticket prices for local and foreign travelers
  Given The trip operator by <Operator> from <Source> to <Mandalay> at <Departrue Time> 
  And John has selected a departure location <Source> and a destination location <Destination>
  And John have set the traveller nationality to <Nationality>
  And John have set the departure date as <Departrue Date>
  When John search for available trips
  And I check the ticket price for a selected trip
  Then the ticket price for <Operator> at <Departure Time> should be <Price>

Examples:
  | Operator    | Source | Destination | Nationality | Departure Date | Departure Time | Price |
  | ABC Express | Yangon | Mandalay    | Local       | Tomorrow       | 08:00 AM       | 20,000|
  | ABC Express | Yangon | Mandalay    | Foreigner   | Tomorrow       | 08:00 AM       | 30,000|
  | XYZ Express | Yangon | Mandalay    | Local       | Tomorrow       | 10:00 AM       | 25,000|
  | XYZ Express | Yangon | Mandalay    | Foreigner   | Tomorrow       | 10:00 AM       | 25,000|
  

