Feature: MMBusTicket Website Home Page

  Scenario: Viewing the Home Page
    Given John opens the bus ticketing website
    When the home page loads
    Then he should see the website's logo
    And the top navigation should include "Home", "Print Ticket", "Contact", and "Language"
    And he should be able to switch the language between English and Myanmar
    And the trip search form should be visible
    And promotional banners or offers should be displayed

  Scenario: Viewing the Footer
    Given John is on the home page
    When he scrolls to the bottom of the page
    Then he should see the footer section
    And it should display the support hotline number
    And it should provide a support messenger link
    And it should include links to "Privacy Policy" and "Terms of Service"
    
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

  Scenario: Viewing the "How to Easily Buy a Bus Ticket" Video Popup
    Given John is on the home page
    Then he should see a button labeled "How to Easily Buy a Bus Ticket"
    When John clicks the "How to Easily Buy a Bus Ticket" button
    Then a popup should appear with the video tutorial
    And the popup should have a title "How to Easily Buy a Bus Ticket"
    And the popup should display the video tutorial
    And the video should be playable directly within the popup
    And the popup should have a close button
    When John clicks the close button
    Then the popup should close and return John to the home page
