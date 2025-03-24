Feature: Payment Selection

  Background:
    Given John has submitted the traveller info
    And John has proceed to the payment selection page

  Scenario: Displaying Payment Methods
    When payment methods are loaded
    Then each payment method should prominently display its logo, name, and accepted currency
    And John should be able to clearly see that each payment method is selectable
    And John should be able to see the booking session ID
    And John should understand that the booking session ID is needed by the support team

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

  Scenario: Applying a Promo Code
    Given John has selected a payment method
    When John clicks on the "Apply Promo Code" button
    Then a field to enter the promo code should be displayed
    And John should be able to enter and apply a promo code
    And the total amount should be updated to reflect the promo code discount if applicable

  Scenario: Viewing Terms and Conditions
    Given John has selected a payment method
    When John clicks on "Terms and Conditions"
    Then the "Terms and Conditions" should be displayed
    And John should be able to read through the "Terms and Conditions"
    And John should be able to close the "Terms and Conditions" view to return to the payment method details

  Scenario: Switching Back to All Payment Methods
    Given John has selected a payment method
    When John clicks on the button to switch back to viewing all payment methods
    Then the screen should display all available payment methods again
    And John should be able to select a different payment method
