Feature: Payment Selection

  Background:
    Given John has submitted the traveller info
    And John has proceed to the payment selection page

  Scenario: Showing payment methods
    When payment methods are loaded
    Then each payment method must prominently display logo, name and accepting currency
    And John should be able to notice that payment methods are selectable

  Scenario: Displaying Payment Method Details
    When John selects a payment method
    Then the payment method should expand to show its details
    And the details screen should display the following information:
      | Info            |
      | Subtotal        |
      | Convenience Fee |
      | Total           |
    And John should be able to proceed with the selected payment method
    And John should see an "Apply Promo Code" button
    And John should be able to read the "Terms and Conditions"
    And John should see a button to switch back to viewing all payment methods
