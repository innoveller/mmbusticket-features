Feature: MMBusTicket Website Home Page

  Scenario: Viewing the Home Page
    Given John navigates to the bus ticketing website home page
    Then he should see the website's logo
    And he should see the top navigation links to "Home", "Print Ticket", "Contact", and "Language"
    And he should see the option to change the language between English and Myanmar
    And he should see the trip search form
    And he should see promotional banners or offers

  Scenario: Viewing the Footer
    Given John is on the home page
    Then he should see the footer section
    And the footer should contain the support hotline number
    And the footer should contain a support messenger link
    And the footer should include links to "Privacy Policy" and "Terms of Service"

  Scenario: Displaying Available Payment Methods on the Home Page
    Given John is on the home page
    Then he should see a section for available payment methods
    And the section should prominently display logos of all accepted payment methods

  Scenario: Viewing Partner Express Bus Lines
    Given John is on the home page
    Then he should see a section for partner express bus lines
    And the section should prominently display the logos of major partner bus lines
    And each logo should be clickable to view more details about the partner bus line

  Scenario: Viewing Details of a Partner Express Bus Line
    Given John is on the home page
    When he clicks on a partner express bus line logo
    Then he should be redirected to a page with detailed information about that bus line
    And the page should include information such as routes, schedules, amenities, and contact details
