Feature: MMBusTicket Website Home Page

  Scenario: Viewing the Home Page
    Given John navigates to the bus ticketing website home page
    Then he should see the website's logo
    And he should see the top navigation links to "Home", "Print Ticket", "Contact", and "Language"
    And he should see the option to change the language between English and Myanmar
    And he should see the trip search form
    And he should see promotional banners or offers